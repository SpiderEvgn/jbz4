class Wechat::Maizuo::Queryorder < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  # format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.queryOrder(orderId)
    # 9. 查询订单信息
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=#{client_id}&orderId=#{orderId}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket3.0/queryOrder", query: { client_id:  "#{client_id}",  
                                                         sign:       "#{sign_value}",
                                                         timestamp:  "#{timestamp}",
                                                         orderId:    "#{orderId}"
                                                         })
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return response['data']
    else
      return nil
    end
  end
end

# orderStatus   订单状态 0:未支付 1:成功 2:失败 3:确认中  订单在状态为 3 的情况下需要10分钟多次查询订单信息