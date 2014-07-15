class WelcomeController < ApplicationController
  def splash
    redirect_to compare_path if user_signed_in?
  end
end
