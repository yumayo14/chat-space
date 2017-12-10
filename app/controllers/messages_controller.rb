class MessagesController < ApplicationController
  before_action :set_group_user, only: [:index, :new, :create]

  def index
    @messages = @group.messages.order('id ASC')
    @message = Message.new
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージが送信されました"
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def set_group_user
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
