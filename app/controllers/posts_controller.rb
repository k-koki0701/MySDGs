class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def ceate
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end

end
