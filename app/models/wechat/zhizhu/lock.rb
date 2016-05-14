class Wechat::Zhizhu::Lock < ActiveRecord::Base
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

  def self.LockSeats(showId, cinemaId, hallId, filmId, seatId, merPrice, 
                   feePrice, parorderId, mobile, activityId, notifyUrl)
    # 2.3.1 锁定座位
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{showId}#{cinemaId}#{hallId}#{filmId}#{seatId}#{merPrice}#{feePrice}#{parorderId}#{mobile}#{activityId}#{notifyUrl}#{client_key}#{private_key}")
    response = get("/lockSeatList.html", query: { key:         "#{client_key}",
                                                  showId:      "#{showId}",
                                                  cinemaId:    "#{cinemaId}",
                                                  hallId:      "#{hallId}",
                                                  filmId:      "#{filmId}",
                                                  seatId:      "#{seatId}",       # "5:07|5:08"
                                                  merPrice:    "#{merPrice}",     # 结算给影院价格,可用于价格验证,规避影 院调价
                                                  feePrice:    "#{feePrice}",     # 每张不得大于影院底价的 20% &&12 元 锁定 2 个座位服务费即 (例如:5.0|5.0)
                                                  parorderId:  "#{parorderId}",   # 商户订单号，保证唯一
                                                  mobile:      "#{mobile}",
                                                  activityId:  "#{activityId}",   # 为空或未传该参数,表示未参加活动; 否则表示参加了活动,值为蜘蛛网活动 id
                                                  notifyUrl:   "#{notifyUrl}",    # 商户接收订单成功报文地址, 可为空
                                                  sign:        "#{sign_value}"
                                                  })['lockSeatList']
    # 判断返回值是否正确
    # "result"=>"3001", "message"=>"选座时，请尽量选连在一起的座位，不要留下单个的空闲座位!"
    # 蜘蛛会判断座位是否落单，如此，可以在controller进行判断，正确则输出结果，否则显示message
    if response['result'].to_s == "0"
      return response['orderInfo']
    else
      return nil
    end
  end

  def self.UnlockSeats(orderId)
    # 2.3.2 解锁座位
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{orderId}#{client_key}#{private_key}")
    response = get("/unLockSeat.html", query: { key:      "#{client_key}", 
                                                orderId:  "#{orderId}",
                                                sign:     "#{sign_value}"
                                              })['unLockSeat']
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return true
    else
      return false
    end
  end

end