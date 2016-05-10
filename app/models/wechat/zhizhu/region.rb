class Wechat::Zhizhu::Region < ActiveRecord::Base
  self.primary_key = "regionId"
  has_many :wechat_zhizhu_cinemas, class_name: 'Wechat::Zhizhu::Cinema', foreign_key: :regionId
  belongs_to :wechat_zhizhu_city, class_name: 'Wechat::Zhizhu::City', foreign_key: :cityId
  
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

  def self.getRegion(cityId)
    # 2.1.2 地区
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{cityId}#{client_key}#{private_key}")
    response = get("/regionList.html", query: { key: "#{client_key}", 
                                                cityId: "#{cityId}",
                                                sign: "#{sign_value}"
                                                })['regionList']
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return response['regionInfo']
    else
      return nil
    end
  end

end

# t.string   "cityId",     limit: 255 # 城市编号（其实就是英文全拼）
# t.string   "regionId",   limit: 255 # 区域编号（changnq）
# t.string   "regionName", limit: 255 # 区域名称（长宁区）