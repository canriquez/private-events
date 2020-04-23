module ApplicationHelper
  def user_invited(event)
    event.guests.include?(@current_user)
  end
end
