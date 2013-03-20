class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorise


  helper_method :current_user

  private

  def current_user

     @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end


   def authorise

    redirect_to sign_in_path, alert: "Not allowed here cheeky!" if params[:id] || params[:user_id] != session[:user_id]
  end

end

# sign_in GET     /sign_in(.:format)                        home#home
# sign_out GET    /sign_out(.:format)                       sessions#destory
# users GET       /users(.:format)                          users#index
# POST            /users(.:format)                          users#create
# POST            /sessions(.:format)                       sessions#create