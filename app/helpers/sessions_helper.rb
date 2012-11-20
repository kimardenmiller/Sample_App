# Hartl Authentication, which I dont' think works with Parse ***

module SessionsHelper

  #def sign_in(newuser)
  #  user = User.authenticate(newuser)
  #  if user
  #    session[:user_id] = user.id
  #    redirect_to root_url, :notice => "You are signed in !"
  #  else
  #    flash.now[:error] = "Invalid username or password ......SessionsHelper"
  #    render "new"
  #  end
  #end

  def sign_in(user)
    #cookies.permanent[:remember_token] = user.remember_token
    #cookies.permanent[:remember_token] = user.sessionToken
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
      @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_sessionToken(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end