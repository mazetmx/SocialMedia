class PostsController < ApplicationController
  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to root_path
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to 
  end

  def like
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    current_user.liked_posts << @post
    redirect_to
  end

  def unlike
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    current_user.liked_posts.destroy(@post)
    redirect_to
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
