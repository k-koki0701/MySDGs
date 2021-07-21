class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destroy]


  def index
    @posts = Post.all.order("id DESC")
  end

  def new
    @post = Post.new
    5.times{@post.pictures.build}
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました！"
  end

  private

  def post_params
    params.require(:post).permit(:content, pictures_attributes: [{image: []},:image_cache])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
