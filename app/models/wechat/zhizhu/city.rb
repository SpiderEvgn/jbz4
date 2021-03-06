class Wechat::Zhizhu::City < ActiveRecord::Base
  self.primary_key = "cityId"
  has_many :wechat_zhizhu_regions, class_name: 'Wechat::Zhizhu::Region', foreign_key: :cityId
  has_many :wechat_zhizhu_cinemas, class_name: 'Wechat::Zhizhu::Cinema', foreign_key: :cityId

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

  def self.getCity
    # 2.1.1 城市
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{client_key}#{private_key}")
    response = get("/cityList.html", query: { key:   "#{client_key}", 
                                              sign:  "#{sign_value}"
                                              })['cityList']
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return response['cityInfo']
    else
      return nil
    end
  end

end

# t.string   "cityId",     limit: 255 # 城市编号（其实就是英文全拼）
# t.string   "cityName",   limit: 255 # 城市名称
# t.string   "cityType",   limit: 255 # 城市类型（1: 直辖市； 2: 非直辖市）