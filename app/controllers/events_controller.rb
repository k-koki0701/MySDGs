class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user
    if @event.save
      redirect_to events_path, notice: "作成しました！"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :schedule, :owner_id)
  end


end
