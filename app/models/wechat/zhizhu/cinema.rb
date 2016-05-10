class Wechat::Zhizhu::Cinema < ActiveRecord::Base
  belongs_to :wechat_zhizhu_city, class_name: 'Wechat::Zhizhu::City', foreign_key: :cityId
  belongs_to :wechat_zhizhu_region, class_name: 'Wechat::Zhizhu::Region', foreign_key: :regionId

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

  def self.getCinema(cityId)
    # 2. 拉取地区列表
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{cityId}#{client_key}#{private_key}")
    response = get("/cinemaList.html", query: { key: "#{client_key}", 
                                                cityId: "#{cityId}",
                                                sign: "#{sign_value}"
                                                })['cinemaList']
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return response['cinemaInfo']
    else
      return nil
    end
  end

end

# t.string   "cityId",       limit: 255 # 城市编号（其实就是英文全拼）
# t.string   "regionId",     limit: 255 # 区域编号（changnq）
# t.string   "cinemaId",     limit: 255 # 影院编号
# t.string   "cinemaName",   limit: 255 # 影院名称
# t.string   "cinemaLogo",   limit: 255 # 影院 logo
# t.string   "cinemaAdd",    limit: 255 # 影院地址
# t.string   "contact",      limit: 255 # 联系电话
# t.string   "getTicketWay", limit: 255 # 取票方式
# t.string   "endbuyDate",   limit: 255 # 场次提前截至售票时间
# t.string   "presaleDay",   limit: 255 # 预售天数
# t.string   "longitude",    limit: 255 # 经度
# t.string   "latitude",     limit: 255 # 纬度


