class PostController < ApplicationController
  
  def new
  end

  def index
    @new_post = Post.new()
    @posts = Post.all
    # binding.pry
    if params[:post_id]
      @post = Post.find(params[:post_id])
      Comment.create(post_id: @post.id, comment: params[:comment],user_id: User.last.id)
    end
    
    respond_to do |format|
      format.html{}
      format.js{@post}
    end
  end

  
  def create
    
    # binding.pry
  	user = current_user
  	user.posts.create(content: params[:post][:content],image: params[:post][:image])
  	flash[:success] = "Post successfully..."
    redirect_to post_index_url

  end

  def comment
    redirect_to post_index_url
  end

end