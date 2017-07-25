class UserMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    opts[:subject] = '主题'
    opts[:from] = 'admin@plsky.cc'
    opts[:reply_to] = 'no_reply@plsky.cc'
    super
  end
end
