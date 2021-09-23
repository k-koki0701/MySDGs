module EventHelper
  def event_error_message(column)
    @event.errors.full_messages_for("#{column}").first
  end
end
