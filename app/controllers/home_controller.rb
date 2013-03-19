class HomeController < ApplicationController
  def home
    @user = User.new
    render :home, :layout => 'home'
  end
end