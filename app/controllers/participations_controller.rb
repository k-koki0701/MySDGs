class ParticipationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @participations = current_user.participations.all
  end

  def create
    @participation = Participation.new(user_id: current_user.id, event_id: params[:event_id])
    redirect_to event_path(@participation.event_id), notice: 'イベントに参加しました!!' if @participation.save
  end

  def destroy
    @participation = Participation.find(params[:id]).destroy
    redirect_to event_path(@participation.event_id), notice: '参加を取り消しました!!'
  end
end
