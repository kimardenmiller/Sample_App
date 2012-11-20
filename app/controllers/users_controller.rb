class UsersController < ApplicationController

  def show
    #@user = User.find(params[:user_id])
    @user = User.find_by_objectId(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #redirect_to @user, :notice => "You are now Signed up! (Older)"
      #sign_in @user
      flash[:success] = "Welcome to Spokenvote! Please sign in"
      redirect_to @user
      #redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
