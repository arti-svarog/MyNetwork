class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session
	helper_method :total_friend

	def authenticate_user
		if !(current_user.payment_status == "success")
    		flash[:success] = "Please complete your payment process."
    		redirect_to payement_url(current_user)
    	end
	end

	def total_friend user
      @friends = Relationship.friend_list(user)
    end

	protected

end
