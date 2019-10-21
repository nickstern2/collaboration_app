class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user.profile = @profile
  end

  def edit
  end

  def update
    @user.profile = @profile
    @user.profile.skills = params[:profile][:skills]
    if @profile.update(profile_params)
    # raise
      redirect_to user_profile_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    authorize @user

  end

  def profile_params
    params.require(:profile).permit(:bio, :skills, :interests, :photo)
  end
end
