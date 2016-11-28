class WelcomeController < ApplicationController
  def index
    @talks = Talk.upcoming.page(1)
  end
end
