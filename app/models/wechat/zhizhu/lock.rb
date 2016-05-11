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

  def self.getLock(showId, cinemaId, hallId, filmId, seatId, merPrice, 
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
                                                  seatId:      "#{seatId}",
                                                  merPrice:    "#{merPrice}",
                                                  feePrice:    "#{feePrice}",
                                                  parorderId:  "#{parorderId}",
                                                  mobile:      "#{mobile}",
                                                  activityId:  "#{activityId}",
                                                  notifyUrl:   "#{notifyUrl}",
                                                  sign:        "#{sign_value}"
                                                  })["lockSeatList"]
    # 判断返回值是否正确
    # "result"=>"3001", "message"=>"选座时，请尽量选连在一起的座位，不要留下单个的空闲座位!"
    # if response['result'].to_s == "0"
    #   return response['orderInfo']
    # else
    #   return nil
    # end
  end

end