module SessionsHelper

  def sign_in(user)
    cookies.permanent[:oauth_token] = user.oauth_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_oauth_token(cookies[:oauth_token])
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_url, notice: "Please sign in."
    end
  end

  def redirect_back_or_root
    redirect_to(session[:return_to] || :root)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:oauth_token)
  end
end