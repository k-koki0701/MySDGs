class PastParticipationsController < ApplicationController
  def index
    @past_participations = Participation.where(user_id: current_user).joins(:event).merge(Event.where("schedule <= ?", Time.now))
  end
end
