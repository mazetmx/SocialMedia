class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @followers = current_user.followers
    @followees = current_user.followees
  end

  def show
    @is_current = true

    if params[:id] and (params[:id].to_i <= User.count) then
      @user = User.find(params[:id])
      @followers = @user.followers
      @followees = @user.followees
      @posts = @user.posts
      @is_current = false || (@user == current_user)
    else
      @user = current_user
      @followers = current_user.followers
      @followees = current_user.followees
      @posts = current_user.posts
    end
  end
end
