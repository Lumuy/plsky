require 'json'
require 'socket'

class Conn
  HOST      = "localhost"
  CONF_FILE = "/etc/shadowsocks.json"
  TEST_FILE = "/Users/lumuy/Downloads/shadowsocks.json"

  def initialize(file = TEST_FILE)
    @file = TEST_FILE
    raise 'File not exist' unless File.exist?(@file)
  end

  def prev_json
    JSON.parse IO.read(@file)
  end

  def add_user(port:, password:)
    tmp = prev_json
    tmp['port_password'].merge!({port.to_s => password})
    IO.write(@file, tmp.to_json)
  end

  # ------------------------------------------------------------------
  #   Range       |      Name         |       Examples
  #   1-1023      |  Well-known ports |  22 (SSH), 80 (HTTP), 443 (HTTPS)
  #   1024-49151  |  Registered ports |  3306 (MySQL), 5432 (PostgreSQL)
  #   49152-65535 |  Ephemeral ports  |  Chrome, Firefox
  # ------------------------------------------------------------------
  # Ports in the 2nd range are assigned by the IANA (Internet Assigned Numbers Authority).

  # And the 3rd range is used for “dynamic” or “ephemeral” ports,
  # these are the ports used by the client side of the connection to receive data from the server.
  def port_used?(port)
    begin
      socket = TCPSocket.new(HOST, port)
      used   = false
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      used   = true
    ensure
      socket.close
    end
    used
  end
end

