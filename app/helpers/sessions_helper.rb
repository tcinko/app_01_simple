module SessionsHelper

  def sign_in(user)
	remember_token = User.new_remember_token
	cookies.permanent[:remember_token] = remember_token
	user.update_attribute(:remember_token, User.encrypt(remember_token))
	self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end


  def current_user
    remember_token  = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
#	-eq        сокращение от:
# 	value = value || new_value
# 	value = new_value unless value
# 	value = new_value if value == nil
# 	if value == nil
# 		value = new_value
# 	end
  end

  def current_user?(user)
	user == current_user
  end

  def signed_in?
    !current_user.nil?
  end


  def sign_out
	current_user.update_attribute(:remember_token,
								User.encrypt(User.new_remember_token))
	cookies.delete(:remember_token)
	self.current_user = nil
  end

#	functions for frendly redirect --------------------------------------------
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
#   end block frendly redirect  -----------------------------------------------
end

