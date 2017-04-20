class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # sessions related
  def authorize_user!
    redirect_to '/login' unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?

  def authorize_admin!
    redirect_to '/digsy_admin/login' unless current_admin
  end

  def current_admin
    @current_admin ||= AdminUser.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  helper_method :log_out

  def log_in(user)
    session[:user_id] = user.id
  end
  helper_method :log_in
end
