class EventChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event_chat = EventChat.new(event_chat_params)
    @event_chat.user_id = current_user.id
    if @event_chat.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def event_chat_params
    params.require(:event_chat).permit(:event_id, :content)
  end
end

end
