class RelationshipsController < ApplicationController

  def follower
    @user = User.find(params[:id])
    @users = @user.followers.select(:id, :name)
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.following.select(:id, :name)
  end

  respond_to? :js
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
