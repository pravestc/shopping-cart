module ApplicationHelper
  def shopkeepers_only(&block)
    block.call if current_user.try(:shopkeeper?)
  end

  def users_only(&block)
    block.call unless current_user.try(:shopkeeper?)
  end

  def signed_users_only(&block)
    block.call unless current_user.try(:shopkeeper?) || !(user_signed_in?)
  end
end
