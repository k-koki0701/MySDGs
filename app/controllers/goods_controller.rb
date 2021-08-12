class GoodsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @goods = current_user.goods.all
  end

  def create
    good = current_user.goods.create(post_id: params[:post_id])
    redirect_to posts_path
  end

  def destroy
    good = current_user.goods.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end

end
