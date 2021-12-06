class EventMessagesController < ApplicationController
    before_action do
      @event_room = EventRoom.find(params[:event_room_id])
    end
  
    def index
      @event_messages = @event_room.event_messages
      @event_messages = @event_messages.order(:created_at)
      @event_message = @event_room.event_messages.build
    end
  
    def create
      @event_message = @event_room.event_messages.build(event_message_params)
      return redirect_to event_room_event_messages_path(@event_room) if @event_message.save
  
      render 'index'
    end
    
    private
  
    def event_message_params
      params.require(:event_message).permit(:body, :user_id)
    end
    
end
