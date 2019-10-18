class LikesController < ApplicationController
  def index
    current_user
    @likes = Like.all

  end

  def show
    @like = Like.find(params[:id])
    authorize @user
  end

  def new
    @current_user = current_user
    @user = User.find(params[:user_id])
    @like = Like.new
    authorize @user
  end

  def create
    @like = Like.new(like_params)
    @user = User.find(params[:user_id])
    @like.user = current_user
    @like.swiped_id = @user.id
    authorize @user


    if @like.save!
      redirect_to users_path
    else
      render "new"
      raise
    end
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:liked)
  end
end
