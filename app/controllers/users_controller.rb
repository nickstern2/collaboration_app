class UsersController < ApplicationController
  def index
    @like = Like.new
    @users = User.all
    @discover_users = User.all
    @discover_users = @discover_users.to_a
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def find_users
    @user = User.all
  end
end
