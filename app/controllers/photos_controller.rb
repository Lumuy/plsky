class PhotosController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :upload
  
  def upload
    @photo = Photo.new
    @photo.image = params[:upload_file]
    @photo.user_id = current_user.id
    if @photo.save
      render json: { :success=> true ,:file_path=> @photo.image.url}
    else
      render json: { :success=> false }
    end
  end

end
