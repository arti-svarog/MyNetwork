class ProfileController < ApplicationController

	def edit
	end

	def show
		@user = User.find(params[:id])
		@sender_id = params[:id]
		@request_status = @user.invited?(current_user)
	end
	
end
