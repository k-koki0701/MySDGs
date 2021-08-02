class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new(user_id: current_user.id, event_id: params[:event_id])
    if @participation.save
      redirect_to event_path(@participation.event_id), notice: 'イベントに参加しました!!'
    end
  end
end
