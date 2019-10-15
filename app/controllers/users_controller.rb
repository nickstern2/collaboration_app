class UsersController < ApplicationController
  def index
    @user = current_user
    @like = Like.new
    @users = User.all
    @discover_users = User.all
    @discover_users = @discover_users.to_a
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end


  def destroy
  end

  private

  def find_users
    @user = User.all
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name)
  end
end
