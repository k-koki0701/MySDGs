class GoodsController < ApplicationController
  def create
    good = current_user.goods.create(post_id: params[:post_id])
    redirect_to posts_path
  end

  def destroy
    good = current_user.goods.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end

end
