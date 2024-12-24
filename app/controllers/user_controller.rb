class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @followers = current_user.followers
  end

  def show
    @user = current_user
    @followers = current_user.followers
    @followees = current_user.followees
    @posts = current_user.posts
  end
end
