class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    # @users = User.all
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end
end
