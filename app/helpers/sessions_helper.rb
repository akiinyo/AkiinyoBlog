module SessionsHelper
  def sign_in(user)
    session[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    current_user = nil
    session.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

  def user_from_remember_token
    remember_token = session[:remember_token]
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end

  def clear_return_to
    session.delete(:return_to)
  end
end
