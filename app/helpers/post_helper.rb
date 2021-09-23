module PostHelper
  def post_error_message(column)
    @post.errors.full_messages_for("#{column}").first
  end
end
