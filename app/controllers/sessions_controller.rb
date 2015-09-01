class SessionsController < ApplicationController
  def new
  end


  def create

# variant whith `form_tag` helper in /app/views/session/new.html.erb
#   user = User.find_by_email(params[:email].downcase)
#   if user && user.authenticate(params[:password])
#   ........

# variant whith `form_for` helper
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end


  def destroy
     sign_out
     redirect_to root_url
  end

end
