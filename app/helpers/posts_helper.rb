module PostsHelper
  def timego(time)
     time.strftime('%Y年%m月%d日  %H:%M:%S') 
  end
end
