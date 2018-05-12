class HomeController < ApplicationController
  def index
    @post = Post.all
  end

  def resume
    render layout: false
  end
end
