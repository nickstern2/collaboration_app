class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = policy_scope(User).order(created_at: :desc)
    @user = current_user
    @like = Like.new
  end

  def show
    @like = Like.new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @profile = @user.profile
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    if @user.update(user_params) && @user.profile.nil?
      # raise
      redirect_to root_path
    elsif @user.update(user_params) && !@user.profile.nil?
      redirect_to user_profile_path(@user.id, @profile.id)
    else
      render "new"
    end
  end

  def destroy
    current_user.likes.delete_all
    @other_like = Like.where(swiped_id: current_user.id)
    @other_like.delete_all
    current_user.destroy
    authorize current_user
      redirect_to root_path
    # redirect_to :back
    # raise
  end

  private

  def set_user
    @user = User.find(params[:id])
    # @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name, :photo, :profile_id)
  end
end
