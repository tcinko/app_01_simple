class RelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
#    redirect_to @user
#
#	 in place of, then using Ajax for follow/unfollow
# ------------------------------------------------------------
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
# ------------------------------------------------------------
#	 end Ajax section

  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
#     redirect_to @user
# 			Ajax section, see `create` method
			respond_to do |format|
			format.html { redirect_to @user }
			format.js
			end
  end
end
