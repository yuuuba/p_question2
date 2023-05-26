class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save!
      redirect_to posts_path, notice: "「#{@post.title}を投稿しました」"
    else
      render :new, notice: "投稿に失敗しました"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path(@post.id)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "投稿が削除されました"
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :question_id)
    end
end
