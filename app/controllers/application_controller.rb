class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

	def authenticate_user
		if !(current_user.payment_status == "success")
    		flash[:success] = "Please complete your payment process."
    		redirect_to payement_url(current_user)
    	end
	end

	protected

end
