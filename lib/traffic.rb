class Traffic
  PORT = 8080

  def initialize(port = PORT)
    @port = port
  end

  # status
  def total_traffic
  end

  def used_traffic
  end

  def unused_traffic
  end

  # change port traffic
  def set_traffic(num)
  end

  def clear_traffic
  end

  def add_traffic(num)
  end

  def reduce_traffic(num)
  end
end

