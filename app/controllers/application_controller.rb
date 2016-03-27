class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def access_denied
    if current_user
      redirect_to :back, alert: 'У вас недостаточно прав для этой операции'
    else
      redirect_to new_user_session_path, alert: 'Вы не вошли в систему'
    end
  end

  def record_not_found
    redirect_to root_path, alert: 'Запись не найдена'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |s|
      s.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
