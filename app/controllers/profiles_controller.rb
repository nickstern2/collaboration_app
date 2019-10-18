class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    @user.profile = @profile
    authorize @user
  end

# DONT need because I already create one on User creation??
  # def new
  # end

  # def create
  # end
# ***********

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
  end
end
