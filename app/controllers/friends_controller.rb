class FriendsController < ApplicationController

  def index
  	@q = User.ransack(firstname_cont: params[:search])
  	@user = @q.result(distinct: true)
  	render json: {:users => @user.order('firstname asc') }
  end

  def friend_list
    @friends = current_user.friends
    # @friends = Relationship.friend_list(current_user)
  end

  def send_request
    # binding.pry
  	reciever = User.find(params[:id])
    current_user.invite reciever
  	# friendship = Relationship.new(user_id: current_user.id,reciever_id: reciever.id,status: "pending")
    # friendship.save
  	flash[:success] = "Request sent successfully..."
    redirect_to profile_url(reciever.id)
  end

  def cancel_request
    user = User.find(params[:id])
    current_user.remove_friendship user
    flash[:success] = "Request cancel successfully..."
    redirect_to profile_url(user.id)
  end

  def timeline
  end

  #All pending requets
  # def request
  #   binding.pry
  #   @requets = Relationship.requests(current_user)
  # end

  def confirm_request
    binding.pry
    user = User.find_by(id: params[:id])
    # request = Relationship.find(params[:id])
    # request.update(status: "accepted")
    current_user.approve user
    flash[:success] = "Request accepted successfully..."
    redirect_to root_url
  end

  def reject_request
    # binding.pry
    user = User.find(params[:id])
    current_user.remove_friendship user
    # request.update(status: "rejected")
    flash[:success] = "Request rejected successfully..."
    redirect_to root_url
  end
  
end