class GoodsController < ApplicationController
  def create
    favorite = current_user.goods.create(post_id: params[:post_id])
    redirect_to posts_path
  end
end
