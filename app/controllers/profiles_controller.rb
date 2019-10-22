class ProfilesController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:show]

  def show
    @user = current_user
    @profile = @user.profile
    authorize @user
  end

  def new
    @user.profile = @profile
    # Profile.create(user_id: @user.id)
  end

  def create
  end

  def edit
    # @user = User.find(current_user.id)
    # @user.profile = @profile
    # @user.profile = @profile
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
    # @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
      # @profile = Profile.where(user_id: 11)
      if @profile.nil?
        @profile = Profile.find(params[:id])
      end
    authorize @user
  end

  def profile_params
    params.require(:profile).permit(:bio, :skills, :interests, :photo, :user_id)
  end
end
