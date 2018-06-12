class FriendsController < ApplicationController

  def index
  	@q = User.ransack(firstname_or_lastname_or_email_cont: params[:search])
  	@user = @q.result(distinct: true)
  	render json: {:users => @user.order('firstname asc') }
  end

  def send_request
  	reciever = User.find(params[:id])
  	friendship = current_user.relationships.new(reciever_id: reciever.id,status: "pending")
    friendship.save
  	flash[:success] = "Request sent successfully..."
    redirect_to profile_url(reciever.id)
  end

  def cancel_request
    reciever = User.find(params[:id])
    relationships = Relationship.where(user_id: current_user.id , reciever_id: reciever.id,status: "pending").first
    relationships.destroy
    flash[:success] = "Request cancel successfully..."
    redirect_to profile_url(reciever.id)
  end

  def timeline
  end
  
end