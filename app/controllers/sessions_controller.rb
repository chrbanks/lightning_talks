class SessionsController < ApplicationController
  skip_before_action :signed_in_user
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    request = OneLogin::RubySaml::Authrequest.new
    redirect_to(request.create(saml_settings))
  end

  def create
    response = OneLogin::RubySaml::Response.new(params[:SAMLResponse], settings: saml_settings)

    if response.is_valid?
      user = User.find_or_create_by(username: response.name_id.split('@').first)
      session[:user_id] = user.username
      redirect_back_or root_path
    else
      authorize_failure
    end
  end

  private

  def saml_settings
    idp_metadata_parser = OneLogin::RubySaml::IdpMetadataParser.new
    settings = idp_metadata_parser.parse_remote(Rails.configuration.idp_metadata_parser)
    settings.assertion_consumer_service_url = Rails.configuration.assertion_consumer_service_url
    settings.issuer                         = Rails.configuration.issuer
    settings.name_identifier_format         = Rails.configuration.name_identifier_format

    settings
  end
end
