class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @events = Event.after_tomorrow_schedule
    @q = @events.ransack(params[:q])
    @events = @q.result(distinct: true)
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

  def show
    @event = Event.find(params[:id])
    @participation = current_user.participations.find_by(event_id: @event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました！"
  end


  private

  def event_params
    params.require(:event).permit(:title, :content, :schedule, :owner_id, :image, :image_cache, :category_id)
  end


end
