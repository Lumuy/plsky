class PostsController < ApplicationController
  before_action :get_post, only: [:edit, :show, :eidt]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @reply = Comment.new
    @comments = @post.comments
  end

  def update
    @post.udpate(post_params)
  end

  def destroy
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
