class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :post_start_at, :post_end_at, :allday, :memo))
    if @post.save
      flash[:alert_success] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:alert_failure] = "スケジュールを登録できませんでした"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :post_start_at, :post_end_at, :allday, :memo))
      flash[:alert_success] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:alert_failure] = "スケジュールを更新できませんでした"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert_failure] = "スケジュールを削除しました"
    redirect_to :posts, status: :see_other
  end
end
