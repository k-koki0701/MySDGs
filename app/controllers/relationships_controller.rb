class RelationshipsController < ApplicationController

  respond_to? :js
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end

  def destroy

  end
end
