class Wechat::Maizuo::Confirmorder < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  # format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.confirmOrder(orderId, count, price, totalprice, mobile)
    # 3. 拉取影院票品
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=#{client_id}&orderId=#{orderId}&timestamp=#{timestamp}&totalPrice=#{totalprice}&key=#{key}")
    response = get("/rest/ticket3.0/confirmOrder", query: { client_id: "#{client_id}",
                                                            orderId: "#{orderId}",
                                                            totalPrice: "#{totalprice}",
                                                            mobile: "#{mobile}",
                                                            price: "#{price}",
                                                            count: "#{count}",
                                                            sign: "#{sign_value}",
                                                            timestamp: "#{timestamp}",
                                                            orderType: "2"
                                                            # 只允许电子票，即选座才能购票
                                                          })
    # 判断返回值是否正确
    if response['result'] == 0 || response['result'] == "0"
      return response['data']
    else
      return false
    end

  end

# t.string   "orderId",           limit: 255 # 订单号
# t.string   "offerId",           limit: 255 # 订座院线ID
# t.string   "confirmId",         limit: 255 # 兑换码
# t.string   "offerOrderId",      limit: 255 # 兑票订单号
# t.string   "thirdConfirmId",    limit: 255 # 第三方前台兑换码 (经3DES加密)//订座票独有 金逸 订座院线特殊取票凭证,金逸自助机和前台的系统是两 家公司做的,取票码不同步,前台兑票码和自助器的兑 票码不一样
# t.string   "takeTicketPostion", limit: 255 # 取票位置提示
# t.text     "smTemplate",       limit: 255 # 短信模版
# t.string   "isCheckGround",     limit: 255 # 落地状态 0:无需要落地,可以认为订单成功; 1:正在影院确认中,这种状态下需要十分钟内来查询三次以上直到落地成功
# t.string   "mobile",            limit: 255 # 手机号
# t.string   "seatType",          limit: 255 # 取票类型-1 为电子票 
                                             # 当 seatType=6 时,thirdConfirmId 有值
                                             # confirmId =12345678 offerOrderId=12345645 thirdConfirmId=123456123
                                             # * 1.请凭订单号12345645和取票码12345678至XX取 票机取票,如遇机器故障凭影院订单号12345645和取 票码12345678至柜台取票
                                             # * 2.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院订单号12345645和取票码12345678至柜 台取票
                                             # * 3.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院取票码12345678至柜台取票
                                             # * 4.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院取票码12345678至柜台取票
                                             # * 5.请凭取票码12345678及手机号至XX取票机取票, 如遇机器故障凭影院取票码12345678及手机号至柜 台取票
                                             # * 6.请凭取票码12345678至XX取票机取票,如遇机器 故障凭影院订单号12345645和取票码123456123至柜 台取票
                                             # * 7.请凭取票码12345678至XX取票机取票,如遇机器 故障凭取票码12345678至柜台取票

end
