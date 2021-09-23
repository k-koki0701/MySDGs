class PostsController < ApplicationController
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

    return redirect_to posts_path, notice: '投稿しました！' if @post.save

    render :new

  end

  def show
    @good = current_user.goods.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    return render 'edit' if @post.user == current_user

    redirect_to posts_path, notice: '作成者のみ投稿の編集できます'
  end

  def update
    return redirect_to posts_path, notice: '編集しました！' if @post.update(post_update_params)

    render :edit
  end

  def destroy
    return redirect_to posts_path, notice: '作成者のみ投稿を削除できます' unless @post.user == current_user

    @post.destroy
    redirect_to posts_path, notice: '削除しました！'
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
