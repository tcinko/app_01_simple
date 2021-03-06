class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
# 	  @users = User.all
	  @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
	  @user = User.find(params[:id])
	  @microposts = @user.microposts.paginate(page: params[:page], per_page: 7)
  end

  def new
	  @user = User.new
  end

  def create
	  @user = User.new(user_params)    # Not the final implementation!

	  if @user.save
		sign_in @user
		redirect_to @user
		flash[:success] = "Welcome to the Sample App!"
	  else
		render 'new'
	  end

  end


  def edit
# 	   @user = User.find(params[:id])         replace for `before_action :correct_user`
  end


  def update
# 	@user = User.find(params[:id])            replace for `before_action :correct_user`
    if @user.update_attributes(user_params)
		flash[:success] = "Profile updated"
		redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
	@user = User.find(params[:id])

	unless @user.admin?
		@user.destroy
		flash[:success] = "User deleted."
	else
		flash[:warning] = "Delete admin record! Rolback transaction!"
	end
	
    redirect_to users_url
  end


  def following
		@title = "Following"
		@user  = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
  end

  def followers
		@title = "Followers"
		@user  = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
  end



private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
	end


# ----- Before filters --------------------------------------------

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

	def admin_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user.admin?
	end

end
