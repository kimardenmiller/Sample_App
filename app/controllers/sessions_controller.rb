class SessionsController < ApplicationController
  def new
  end

  def create
    #render"new"

    #*** Hartl Suggestion ***
  #user = User.find_by_username(params[:session][:username].downcase)
  #  if user && User.authenticate(params[:session][:username], params[:session][:password])
  #    sign_in user
  #    redirect_to user
  #  else
  #    flash.now[:error] = 'Invalid email/password combination' # Not quite right!
  #    render 'new'
  #  end

    #*** ParseResource Suggestion ***
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "You are signed in !"
    else
      flash.now[:error] = "Invalid username or password ...... create action"
      render "new"
    end
  end

  #
  #def directin
  #  user = User.authenticate(thisuser)
  #  if user
  #    session[:user_id] = user.id
  #    redirect_to root_url, :notice => "You are signed in !"
  #  else
  #    flash.now[:error] = "Invalid username or password ......directin action"
  #    render "new"
  #  end
  #end
  #
  #def signinnow
  #  thisuser[:username => "kimardenmiller@gmail.com", :password => "lockup99"]
  #  #@temp = params[username: "kimardenmiller@gmail.com"], params[password: "lockup99"]
  #  directin
  #end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out via the destroy method!"
  end

end