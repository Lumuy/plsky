require 'rqrcode'

class QrcodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @ss_conf = current_user.ss_conf
    @qr = RQRCode::QRCode.new(@ss_conf.base64_qrcode) if @ss_conf
  end

  private

  def authenticate_user!
    render text: 'not a user' unless current_user
  end
end
