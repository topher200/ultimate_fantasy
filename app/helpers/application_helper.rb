module ApplicationHelper
  def is_admin?
    current_user.try(:admin)
  end
end
