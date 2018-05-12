class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_param)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
      flash[:success] = '评论成功'
    else
    end
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
