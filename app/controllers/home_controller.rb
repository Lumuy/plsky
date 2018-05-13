class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def resume
    render layout: false
  end
end
