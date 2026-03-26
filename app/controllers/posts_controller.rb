class PostsController < ApplicationController
before_action :set_post, only: %i[ show edit update destroy]

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

    if @post.save
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
  end
end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
  end
end

  def destroy
    if @post.destroy 
      redirect_to posts_path, notice: "Post was sucessfully deleted."
    else
      redirect_to post_path(@post), alert: "Failed to delete the post."
  end
end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
