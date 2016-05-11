class Wechat::Zhizhu::Show < ActiveRecord::Base
  belongs_to :wechat_zhizhu_cinema, class_name: 'Wechat::Zhizhu::Cinema', foreign_key: :cinemaId
  belongs_to :wechat_zhizhu_film, class_name: 'Wechat::Zhizhu::Film', foreign_key: :filmId
  
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

  def self.getShow(cinemaId, showDate)
    # 2.2.5 场次
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{cinemaId}#{showDate}#{client_key}#{private_key}")
    response = get("/showList.html", query: { key:       "#{client_key}", 
                                              cinemaId:  "#{cinemaId}",
                                              showDate:  "#{showDate}",
                                              sign:      "#{sign_value}"
                                              })['showList']
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return response['showInfo']
    else
      return nil
    end
  end

end

# t.string   "showId",      limit: 255 # 场次编号
# t.string   "cinemaId",    limit: 255 # 影院编号
# t.string   "cinemaName",  limit: 255 # 影院名称
# t.string   "hallId",      limit: 255 # 影厅编号
# t.string   "hallName",    limit: 255 # 影厅名称
# t.string   "filmId",      limit: 255 # 影片编号
# t.string   "filmName",    limit: 255 # 影片名称
# t.string   "showDate",    limit: 255 # 放映日期
# t.string   "showTime",    limit: 255 # 放映时间
# t.string   "staPrice",    limit: 255 # 标准价格
# t.string   "staPrice",    limit: 255 # 用户价格
# t.string   "merPrice",    limit: 255 # 影院底价
# t.string   "feePrice",    limit: 255 # 服务费
# t.string   "language",    limit: 255 # 影片语言
# t.string   "duration",    limit: 255 # 片长
# t.string   "dimensional", limit: 255 # 维度
# t.string   "activityId",  limit: 255 # 活动标识（商户参与活动，蜘蛛网分配的活动编号）



