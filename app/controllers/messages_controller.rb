class MessagesController < ApplicationController
  def index
    @users = policy_scope(User).order(created_at: :desc)
    @user = User.find(params[:user_id])
    @message = Message.all
    # @user = User.f
  end

  def show
    @user = User.find(params[:user_id])
    @messages = Message.where(user_id: @user.id)
    @message = Message.new
    authorize @user
  end

  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @message = Message.new
    authorize @user
  end

  def create
    @users = User.all
    @user = User.find(params[:user_id])
    # @like = Like.find(params[:like_id])
    @message = Message.new
    @message.user_id = current_user.id
    @message.sent = params[:message][:sent].strip
    @message.receiver_id = params[:message][:user_id]
    authorize @user

    if @message.save(message_params)
      redirect_to root_path
    else
      render "new"
      raise
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:sent, :received, :user_id, :receiver_id)
  end
end
