class GoodsController < ApplicationController

  def index
    @goods = current_user.goods.all
  end

  def create
    @post = Post.find(params[:post_id])
    good = current_user.goods.build(post_id: params[:post_id])
    good.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    good = Good.find_by(post_id: params[:post_id], user_id: current_user.id)
    good.destroy
  end
end
