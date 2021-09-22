class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all.includes(:user, :pictures, :goods).order('id DESC')
    @q = @posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
    @categories_month = Post.categories_ranking_month
    @categories_year = Post.categories_ranking_year
  end

  def new
    @post = Post.new
    5.times { @post.pictures.build }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: '投稿しました！'
    else
      render :new
    end
  end

  def show
    @good = current_user.goods.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    if @post.user == current_user
      render 'edit'
    else
      redirect_to posts_path, notice: '作成者のみ投稿の編集できます'
    end
  end

  def update
    if @post.update(post_update_params)
      redirect_to posts_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: '削除しました！'
    else
      redirect_to posts_path, notice: '作成者のみ投稿を削除できます'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, pictures_attributes: %i[id image image_cache], category_ids: [])
  end

  def post_update_params
    params.require(:post).permit(:content, pictures_attributes: %i[id image image_cache _destroy],
                                           category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
