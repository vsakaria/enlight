class SessionsController < ApplicationController

  skip_before_filter :authorise, :only => [:create, :destory]


  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id]  = @user.id
      redirect_to feed_user_path(@user)
    else
      flash.now.alert = "Invaild email or Password"
      render "new"
    end
end

  def destory
    session[:user_id] = nil
    redirect_to root_url
  end
end
