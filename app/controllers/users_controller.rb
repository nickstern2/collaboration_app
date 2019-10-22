class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    if @user.update(user_params)
      # raise
      redirect_to user_profile_path(@user.profile.id)
      # redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    @user.likes.delete_all
    @other_like = Like.where(swiped_id: @user.id)
    @other_like.delete_all
    @user.destroy
    # raise
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name, :photo)
  end
end
