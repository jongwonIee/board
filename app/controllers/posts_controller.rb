class PostsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @posts_love = @posts.where(category_id: 1)
    @posts_life = @posts.where(category_id: 2)
    @posts_serious = @posts.where(category_id: 3)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to posts_path

  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete

    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :content, :category_id)
    end
 end