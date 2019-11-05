class MessagesController < ApplicationController
  before_action :all_messages, only: [:index, :show]
  def index
    @users = policy_scope(User).order(created_at: :desc)
    # @user = User.find(params[:user_id])
    @message = Message.all
  end

  def show
    # @user = User.find(params[:user_id])
    # @messages = Message.where(user_id: @user.id)
    @messages = Message.where(user_id: @user.id) + Message.where(receiver_id: @user.id)
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
    if !params[:receiver_id].nil?
      # FOR CREATE NEW MESSAGE
      @user = User.find(params[:receiver_id])
    else
      # FOR AJAX
      @user = User.find(params[:message][:receiver_id])
    end
    @message = Message.new
    @message.user_id = current_user.id
    @message.sent = params[:message][:sent].strip
    @message.receiver_id = params[:message][:receiver_id]
    @message.receiver_id = @user.id
    authorize @user

    if @message.save(message_params)
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { render json: @message }
        # ***Make it auto for incomming messages too****
      end
    else
      render "new"
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:sent, :received, :user_id, :receiver_id)
  end

  def all_messages
    @user = User.find(params[:user_id])
    @sent = Message.where(user_id: current_user.id)
    @received = Message.where(receiver_id: current_user.id)
  end
end
