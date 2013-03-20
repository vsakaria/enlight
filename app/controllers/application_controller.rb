class ApplicationController < ActionController::Base
  protect_from_forgery

#before_filter :authorise


  helper_method :current_user

  private

  def current_user

     @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  # def authorise
  #   redirect_to sign_in_path, alert: "Not allowed here cheeky!" if current_user.nil?
  # end
end

