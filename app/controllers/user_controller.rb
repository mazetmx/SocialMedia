class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @posts = current_user.posts
  end
end
