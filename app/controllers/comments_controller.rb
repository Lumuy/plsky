class CommentsController < ApplicationController
  before_action :set_post, :set_user
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_param)
    @comment.post_id = @post.id
    @comment.registration_user_id = @user.id
    if @comment.save
      flash[:success] = '回复成功'
    else
      flash[:danger] = '回复失败'
    end
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    if @comment.update(comment_param)
      flash[:success] = '修改成功'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_user
    @user = current_user
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_param
    params.require(:comment).permit(:body)
  end
end
