class ApplicationController < ActionController::Base
 
  helper :all
 
  protect_from_forgery
  
  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to view this page"
    redirect_to root_url
  end
  
  
  private
  
  # Standard Current User variables
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end
