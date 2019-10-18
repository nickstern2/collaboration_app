class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User)
    @like = Like.new
    # @user = User.find(params[:id])
    # @users = User.all
    # @discover_users = User.all
    # @discover_users = @discover_users.to_a
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    if @user.update(user_params)
      redirect_to user_profile_path(@user.id)
    else
      render "new"
    end
  end

  def destroy
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
