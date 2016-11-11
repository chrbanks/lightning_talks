require 'rails_helper'

RSpec.describe Admin::ApplicationController, :vcr, type: :controller do
  describe "GET #index" do
    context 'as admin' do
      let(:user) { create(:user, :admin) }

      it "returns http success" do
        mock_sign_in(user)
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'as non-admin'
      let(:user) { create(:user) }

      it 'redirects to root' do
        mock_sign_in(user)
        get :index
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq 'You must be an admin to do that.'
    end
  end
end
