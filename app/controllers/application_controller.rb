class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_authorize!
  	if current_user.role != 'admin'  
  		redirect_to articles_path, :notice => "Invalid user"
  	end	
  end	
end
