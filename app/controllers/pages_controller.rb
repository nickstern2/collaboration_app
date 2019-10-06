class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to new_user_session_path if current_user.nil?
    @users = User.all
    # @user = User.find(params[:id])
  end
end
