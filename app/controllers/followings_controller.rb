class FollowingsController < ApplicationController
  def create
    @followee = User.find(params[:followee_id])
    @follower = current_user

    if @follower != @followee && !@follower.followees.include?(@followee)
      Following.create!(followee_id: @followee.id, follower_id: @follower.id)
    end

    redirect_to @followee
  end

  def destroy
    @followee = User.find(params[:followee_id])
    @follower = current_user

    Following.find_by(follower_id: @follower.id, followee_id: @followee.id).destroy!

    redirect_to @followee
  end
end
