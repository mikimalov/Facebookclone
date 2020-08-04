module UsersHelper
  def logged_in?(user)
    session[:user_id] = user.id
  end

  def user_present?
    user_with_same_id?.present?
  end

  def user_with_same_id?
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def liked?(user, article)
    user.likes.present? && article.likes.present?
  end
end
