class Wechat::Zhizhu::Film < ActiveRecord::Base
  self.primary_key = "filmId"
  has_many :wechat_zhizhu_shows, class_name: 'Wechat::Zhizhu::Show', foreign_key: :filmId
  
  
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

  def self.getFilm
    # 2.2.4 影厅
    client_key = ENV['JBZ4_ZHIZHU_CLIENT_KEY']
    private_key = ENV['JBZ4_ZHIZHU_PRIVATE_KEY']
    sign_value = Digest::MD5.hexdigest("#{client_key}#{private_key}")
    response = get("/filmList.html", query: { key: "#{client_key}", 
                                              sign: "#{sign_value}"
                                              })['filmList']
    # 判断返回值是否正确
    if response['result'].to_s == "0"
      return response['filmInfo']
    else
      return nil
    end
  end

end

# t.string   "filmId",      limit: 255   # 影片编号
# t.string   "filmName",    limit: 255   # 影片名称
# t.string   "englishName", limit: 255   # 英文名称
# t.string   "language",    limit: 255   # 影片语言
# t.string   "duration",    limit: 255   # 片长
# t.string   "dimensional", limit: 255   # 维度
# t.string   "country",     limit: 255   # 国家 / 地区
# t.string   "director",    limit: 255   # 导演
# t.string   "actor",       limit: 255   # 主演
# t.string   "openingDate", limit: 255   # 上映日期
# t.string   "catalog",     limit: 255   # 影片类型
# t.string   "picture",     limit: 255   # 海报
# t.text     "description", limit: 65535 # 描述




