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


  def dislike_user
    @users = User.all
    @discover_users = @users
    @discover_users = @discover_users.to_a

    deleted_user = User.find(params[:user_id])
    ele = @discover_users.find_index(deleted_user)

     @discover_users = @discover_users.delete_at(ele)
     # raise
     # @discover_users
     redirect_to users_path(@discover_users)

  end

  private

  def find_users
    @user = User.all
  end

end
