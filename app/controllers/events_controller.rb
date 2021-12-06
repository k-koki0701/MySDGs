class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

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
      @event_room = EventRoom.create(event_id: @event.id)
      return redirect_to events_path, notice: '作成しました！' 
    else
      render :new
    end

  end

  def show
    @participation = current_user.participations.find_by(event_id: @event.id)
    @participation_users = @event.participations.includes(:user).order(:created_at)
    @users = Participation.where(event_id: params[:id]).pluck(:user_id)
    @event_room = EventRoom.where(event_id: params[:id]).pluck(:id)
  end

  def edit
    return render 'edit' if @event.owner == current_user

    redirect_to events_path, notice: '作成者のみイベントの編集できます'
  end

  def update
    return redirect_to events_path, notice: '編集しました！' if @event.update(event_params)

    render :edit
  end

  def destroy
    return redirect_to events_path, notice: '作成者のみイベントを削除できます' unless @event.owner == current_user

    @event.destroy
    redirect_to events_path, notice: '削除しました！'
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :schedule, :owner_id, :image, :image_cache, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
