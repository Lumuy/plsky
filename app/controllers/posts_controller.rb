class PostsController < ApplicationController
  before_action :set_user
  before_action :get_post, only: [:edit, :show, :eidt, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.registration_user_id = @user.id
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
    if @post.update(post_params)
      flash[:success] = '修改成功'
      redirect_to post_path(@post)
    else
      flash[:info] = '修改失败'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
      flash[:success] = '删除成功'
    else
      flash[:success] = '删除失败'
      render 'show'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
