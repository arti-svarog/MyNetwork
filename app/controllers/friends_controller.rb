class FriendsController < ApplicationController
  def index
  	# binding.pry
  	@q = User.ransack(firstname_or_lastname_or_email_cont: params[:search])
  	@user = @q.result(distinct: true)
  	render json: {:users => @user.order('firstname asc') }
  end


  def send_request
  	user = User.find(params[:id])
  	current_user.invite user
  	flash[:success] = "Request sent successfully..."
    redirect_to root_url
  end

  def timeline
    
  end
  
end
