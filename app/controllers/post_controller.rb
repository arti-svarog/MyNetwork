class PostController < ApplicationController
  before_action :authenticate_user

  def new
  end

  def index
    @new_post = Post.new()
    @posts = current_user.posts.order_by(:created_at.desc)
    @friends = Relationship.friend_list(current_user)
    if params[:post_id]
      @post = Post.find(params[:post_id])
      Comment.create(post_id: @post.id, comment: params[:comment],user_id: current_user.id)
    end
    respond_to do |format|
      format.html{}
      format.js{@post}
    end
  end

  
  def create
    # binding.pry
  	user = current_user
  	post = user.posts.create(content: params[:post][:content])
  	# p"========#{post.inspect}====="
    params[:post][:image].each do |img|
      post.images.create(image: img,user_id: current_user.id)
    end
    flash[:success] = "Post successfully..."
    redirect_to post_index_url
  end

  def comment
    redirect_to post_index_url
  end

  def delete_comment
    comment =  Comment.find(params)
    comment.destroy
    flash[:success] = "Comment delete successfully..."
    redirect_to post_index_url
  end

  def destroy
    post = Post.find(params)
    post.destroy
    flash[:success] = "Post delete successfully..."
    redirect_to post_index_url
  end

  private
  # def post_params 
  #   # binding.pry
  #   params.require(:post).permit(:content, images_attributes: [:id, :image, :_destroy])
  # end

end