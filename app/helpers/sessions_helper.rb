module SessionsHelper
	
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def current_user=(user)
  	@current_user = user
 	end

 	def current_user
  	remember_token = User.digest(cookies[:remember_token])
  	@current_user ||= User.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def forget(user)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    self.current_user = nil
  end

  def signed_in_user
    redirect_to signin_url, notice: "Por favor inicie sesion" unless signed_in?
  end

end
