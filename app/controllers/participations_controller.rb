class ParticipationsController < ApplicationController

  def index
    @participations = Participation.where(user_id: current_user).joins(:event).merge(Event.where("schedule >= ?", Time.now))
  end

  def create
    @participation = Participation.new(user_id: current_user.id, event_id: params[:event_id])
    if @participation.save
      @event_room = EventRoom.create(event_id: params[:event_id]) if EventRoom.where(event_id: params[:event_id]).count == 0 
      redirect_to event_path(@participation.event_id), notice: 'イベントに参加しました!!' 
    end  
  end

  def destroy
    @participation = Participation.find(params[:id]).destroy
    redirect_to event_path(@participation.event_id), notice: '参加を取り消しました!!'
  end
end
