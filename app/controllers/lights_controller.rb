

class LightsController < ApplicationController
  # GET /lights
  # GET /lights.json
  def index

    @lights = Light.all


  end

  # GET /lights/1
  # GET /lights/1.json
  def show

    @user = User.find(params[:user_id])
    @lights = Light.where(:user_id => params[:user_id])

  end

  # GET /lights/new
  # GET /lights/new.json
  def new

    @user = User.find(params[:user_id])

    @light = Light.new

  end

  # # GET /lights/1/edit
  # def edit
  #   @light = Light.find(params[:id])
  # end

  def create

    #How could I refactor this?
    @user = User.find(params[:user_id])

    @light = @user.lights.build(params[:light])
    @light.save!


    redirect_to(feed_user_path(@user))

  end


  def update

    @light = Light.find(params[:id])

  end


  def destroy
    @light = Light.find(params[:id])
    @light.destroy

    redirect_to(feed_user_path(params[:user_id]))
  end
end
