class ProfilesController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:new, :create]

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
    authorize @user
  end

  def create
    @user = User.find(params[:user_id])
    @profile = Profile.new
    @user.profile = @profile
    authorize @user
    # Profile.create(user_id: @user.id)
    @user.profile.skills = params[:profile][:skills]
    @user.profile.bio = params[:profile][:bio]
    if @profile.save(profile_params)
      # raise
      # redirect_to users_path
      redirect_to user_profile_path(@user.id, @profile.id)
    else
      render 'new'
    end
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
      # if @profile.nil?
      #   @profile = Profile.find(params[:id])
      # end
    authorize @user
  end

  def profile_params
    params.require(:profile).permit(:bio, :skills, :interests, :photo)
  end
end
