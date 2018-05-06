require 'rest-client'

class SmsVerificationService
  def initialize(params)
    @phnum = params[:phnum]
    @vcode = params[:vcode]
  end

  ApiKey = "e713d964c821e52bc5a674b51aaaf42c"

  SendSmsUrl = "https://sms.yunpian.com/v2/sms/single_send.json"
  ContentUrl  = "https://sms.yunpian.com/v2/tpl/get.json"

  def get_content
    begin
      response = RestClient.post ContentUrl, { "apiKey": ApiKey }
    rescue RestClient::ExceptionWithResponse => err
      err.response
    end
    response.first[:tpl_content] if response
  end

  def send_sms
    content = "【玉逍遥】您的验证码是#{@vcode}"
    p content
    p @vcode
    send_param = {
      "apikey": ApiKey,
      "mobile": @phnum,
      "text": content
    }
    response = RestClient.post SendSmsUrl, send_param
    response.code == 200
  end

end
