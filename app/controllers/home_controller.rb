class HomeController < ApplicationController

   #skip_before_filter :authorise, :only => [:home]
  def home
    @user = User.new

    render :home, :layout => 'home'
  end
end