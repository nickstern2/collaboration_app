class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    @user.profile = @profile
  end
end
