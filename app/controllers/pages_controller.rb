class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to new_user_session_path if current_user.nil?
    @users = User.all

    # if current_user.first_name.nil? && current_user.last_name.nil?
    #   render "../views/users/name_form"
    # else

    # @users = User.all
    end
  end

