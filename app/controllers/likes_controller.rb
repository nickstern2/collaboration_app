class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @likes = Like.all
    @users = policy_scope(User).order(created_at: :desc)
    @like = Like.new
    @update_like = current_user.likes.where(swiped_id: @user.id)[0]
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

  def edit
    raise
    @user = User.find(params[:user_id])
    @like = Like.find(params[:id])
  end

  def update

    @user = User.find(params[:user_id])
    @like = Like.find(params[:id])
    @like.liked = params[:like][:liked]
    # raise
    authorize @user

    if @like.update(like_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:liked)
  end
end
