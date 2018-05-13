module ApplicationHelper

  def header(text)
    content_for(:header) { text.to_s }
  end

  def uptonow(time)
    now = Time.now
    years = now.year - time.year
    months = now.month - time.month
    days = now.day - time.day
    hours = now.hour - time.hour
    minutes = now.min - time.min
    seconds = now.sec - time.sec

    if years > 0
      years.to_s + '年前'
    elsif months > 0
      months.to_s + '月前'
    elsif days > 0
      days.to_s + '天前'
    elsif hours > 0
      hours.to_s + '小时前'
    elsif minutes > 0
      minutes.to_s + '分钟前'
    else
      seconds.to_s + '秒前'
    end
  end

  def model_time_interval model
    if model.updated_at > model.created_at
      '更新于' + uptonow(model.updated_at)
    else
      '发布于' + uptonow(model.created_at)
    end
  end

end
