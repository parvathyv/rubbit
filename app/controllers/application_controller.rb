class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_authorize!
    if current_user.role != 'admin'
      redirect_to articles_path, notice: "Invalid user"
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :role, :profile_photo]
  end
end
