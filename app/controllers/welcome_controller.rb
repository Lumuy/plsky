class WelcomeController < ApplicationController
  def index
  end

  def resume
    render layout: false
  end
end
