class LikesController < ApplicationController
  def new
  end

  def index
  	# binding.pry
  	post = Post.find(params[:post_id])
  	like = Like.where(user_id: current_user.id, post_id: params[:post_id]).first
  	unless like
  		Like.create(user_id: User.last.id, post_id: post.id)
  		render json: {count: post.likes.count,status: true}
  	else
  		like.destroy
  		render json: {count: post.likes.count,status: false}
  	end
  end
  def downvote
  	# binding.pry
  	params[:post_id] = params[:post_id].split("_")[1]
  	post = Post.find(params[:post_id])
  	unlike = Unlike.where(user_id: current_user.id, post_id: params[:post_id]).first
  	unless unlike
  		Unlike.create(user_id: User.last.id, post_id: post.id)
  		render json: {count: post.unlikes.count,status: true}
  	else
  		unlike.destroy
  		render json: {count: post.unlikes.count,status: false}
  	end
  end

end
