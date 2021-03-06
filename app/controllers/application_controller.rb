class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #     u.permit(:username, :email, :password, :password_confirmation)
  #   end
  # end

  def require_login
    unless current_user
      redirect_to new_user_session_path, alert: "You must sign in to take that action."
    end
  end

  def after_sign_in_path_for(resource)
    quotes_path
  end
end
