class UsersController < ApplicationController
  def index
    @users = User.all
    @discover_users = @users
    # @discover_users = @discover_users.dislike_user
    @discover_users = @discover_users.to_a
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end

  def dislike_users
    @users = User.all
    @discover_users = @users
    @discover_users = @discover_users.to_a

    deleted_user = User.find(params[:id])
    ele = @discover_users.find_index(deleted_user)

    @discover_users.delete_at(ele)
     # @discover_users
     redirect_to users_path

  end

  private

  def find_users
    @user = User.all
  end

end
