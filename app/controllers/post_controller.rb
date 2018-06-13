class PostController < ApplicationController
  
  def new
  end

  def index
    @new_post = Post.new()
    @posts = Post.all.order_by(:created_at.desc)
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
  	user = current_user
  	user.posts.create(content: params[:post][:content],image: params[:post][:image])
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

end