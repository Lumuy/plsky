require 'base64'

class SsConf < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'registration_user_id', optional: true

  validates :port, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1,
                                   less_than_or_equal_to: 65534 }

  def ss_uri
    "%s:%s@%s:%d" % [method, password, host, port]
  end

  def base64_qrcode
    "ss://%s" % Base64.encode64(ss_uri)
  end

  def to_json
    {
    "index": 1,
    "random": false,
    "sysProxyMode": 2,
    "shareOverLan": false,
    "bypassWhiteList": false,
    "localPort": 1080,
    "reconnectTimes": 4,
    "randomAlgorithm": 0,
    "TTL": 60,
    "connect_timeout": 5,
    "proxyEnable": false,
    "pacDirectGoProxy": false,
    "proxyType": 0,
    "proxyHost": "",
    "proxyPort": 0,
    "proxyAuthUser": "",
    "proxyAuthPass": "",
    "proxyUserAgent": "",
    "authUser": "",
    "authPass": "",
    "autoBan": false,
    "sameHostForSameTarget": true,
    "keepVisitTime": 180,
    "isHideTips": false,
    "dns_server": "",
    "proxyRuleMode": 1,
    "token": [],
    "portMap": [],
    "configs": [
        {
            "remarks": "2.\u7f8e\u56fd\u4e3b\u529b2 \u6d41\u91cf\u6bd4\u4f8b:1.2",
            "server": self.host,
            "server_port": self.port,
            "method": "rc4-md5",
            "obfs": "plain",
            "obfsparam": "",
            "remarks_base64": "Mi7nvo7lm73kuLvlipsyIOa1gemHj+avlOS+izoxLjI=",
            "password": self.password,
            "tcp_over_udp": false,
            "udp_over_tcp": false,
            "group": "\u770b\u4e16\u754c-\u7a7f\u8d8a\u670d\u52a1",
            "protocol": "origin",
            "obfs_udp": false,
            "enable": true
        }
     ]
    }
  end

end
