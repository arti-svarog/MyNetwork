class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

	protected  
    def after_sign_in_path_for(resource)
    	unless (resource.payment_status == "success")
    		sign_in_url =  payement_url(resource)
    	else
      		sign_in_url = post_index_url
    	end
    end

end
