class Wechat::Maizuo::Lock < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  # format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.lockSeats(orderId, foretellId, seatIds, count, price, mobile)
    # 6. 锁定座位
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=#{client_id}&count=#{count}&foretellId=#{foretellId}&orderId=#{orderId}&price=#{price}&seatIds=#{seatIds}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket3.0/lock", query: { client_id: "#{client_id}",
                                                    orderId: "#{orderId}",
                                                    foretellId: "#{foretellId}",
                                                    seatIds: "#{seatIds}",
                                                    count: "#{count}",
                                                    price: "#{price}",
                                                    sign: "#{sign_value}",
                                                    timestamp: "#{timestamp}",
                                                    mobile: "#{mobile}"
                                                  })
    # 判断返回值是否正确
    if response['result'] == 0 || response['result'] == "0"
      return true
    else
      return false
    end

  end

  def self.unlockSeats(orderId)
    # 7. 取消锁定的座位
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=#{client_id}&orderId=#{orderId}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket3.0/unLock", query: { client_id: "#{client_id}",
                                                      orderId: "#{orderId}",
                                                      sign: "#{sign_value}",
                                                      timestamp: "#{timestamp}"
                                                    })
    # 判断返回值是否正确
    # if response['result'] == 0 || response['result'] == "0"
    #   return true
    # else
    #   return nil
    # end

  end

end
