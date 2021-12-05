class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    @messages.where.not(user_id: current_user.id).update_all(read: true) if @messages.last
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    return redirect_to conversation_messages_path(@conversation) if @message.save

    render 'index'
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
