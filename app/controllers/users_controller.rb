class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index

    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new

    @user = User.new(params[:user])
    if @user.save
      redirect_to feed_user_path(@user)
    else
      render "new"
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end

  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    @user.save

    #Why do I have to pass the USer varaible here? I can't access it.
    redirect_to(feed_user_path(@user))


  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to :action => "feed" }
  #     else
  #       format.html { render action: "new" }
  #     end
  #   end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def feed
    @user = User.find_by_id(params[:id])
    @lights = Light.where(:user_id => params[:id])
    @people = User.all

    #Top ten lights without user name
    @topten = Light.last(10)

    #@topten.each do |light|
      #This is the long way around this
      # light.class.module_eval { attr_accessor :name }
      # @topuser = User.find_by_id(light.user_id)
      # light.name = @topuser.name
    #end

  end
end
