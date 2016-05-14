class Wechat::Zhizhu::Confirmorder < ActiveRecord::Base
  include HTTParty

  # 测试环境:http 请求:http://test.spider.com.cn:9391/v2/{商户 key}/{method}.html 
  # 可以copy下列命令。以下为测试的 商户key 和 秘钥。
  # export JBZ4_ZHIZHU_CLIENT_KEY='ceshi'
  # export JBZ4_ZHIZHU_PRIVATE_KEY='0051657786'

  # 正式环境:http 请求:http://filmapi.spider.com.cn/v2/{商户 key}/{method}.html
  base_uri "http://filmapi.spider.com.cn/v2/#{ENV['JBZ4_ZHIZHU_CLIENT_KEY']}"

  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5  还没想好怎么用timeout

  def self.ConfirmOrder(orderId, mobile)
    # 2.3.3 确认订单
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{orderId}#{mobile}#{client_key}#{private_key}")
    response = get("/confirmOrder.html", query: { key:      "#{client_key}", 
                                                  orderId:  "#{orderId}",
                                                  mobile:   "#{mobile}",
                                                  sign:     "#{sign_value}"
                                                  })['confirmOrder']
    # 判断返回值是否正确
    # {"result"=>"3008", "message"=>"手机号不正确"}
    # 蜘蛛会判断手机号格式是否正确，如此，可以在controller进行判断，正确则输出结果，否则显示手机号错误
    if response['result'].to_s == "0"
      return response['orderInfo']
    else
      return response['message']
    end
  end

end
