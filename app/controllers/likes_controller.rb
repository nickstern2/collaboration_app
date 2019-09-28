class LikesController < ApplicationController

  def index
    current_user
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def new
    @current_user = current_user
    @user = User.find(params[:user_id])
    @like = Like.new
  end

  def create
    @current_user = current_user
    @user = User.find(params[:user_id])
    @like = Like.new(like_params)
    if @like.save!
      redirect_to discover_path
    else
      render "new"
      raise
    end
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :swiped_id, :liked)
  end
end
