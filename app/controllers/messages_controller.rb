class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :create]

  def index
    @name = current_user.name
    @groups = current_user.groups
    @messages = @group.messages
    @message = current_user.messages.new
  end

  def new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice: "メッセージが送信されました"}
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

end
