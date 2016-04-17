class Maizuofilm < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  default_timeout 5

  def self.getFilms
  	# (start, count, isShow)
    # 2. 拉取电影列表
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=52642103681&timestamp=#{timestamp}&key=xkGEr244(((<HAee4346fg")
    get("/rest/ticket3.0/films", query: { client_id: "52642103681",  
                                          sign: "#{sign_value}",
                                          timestamp: "#{timestamp}"
                                          })['data']['films']
  end
end

# t.string   "filmId",          limit: 255 # 电影iD（文档中是id，因为和rails默认冲突，故改）
# t.string   "name",            limit: 255 # 电影名
# t.string   "director",        limit: 255 # 导演，多个名字用｜分隔
# t.string   "actors",          limit: 255 # 主演，多个名字用｜分隔
# t.string   "filmType",        limit: 255 # 影片类型，多个名字用｜分隔
# t.string   "area",            limit: 255 # 国家地区，多个名字用｜分隔
# t.string   "length",          limit: 255 # 片长（分钟）
# t.string   "releaseDate",     limit: 255 # 首映日期（YYYY-MM-DD）
# t.string   "isShow",          limit: 255 # 1:正在上映 2:即将上映
# t.string   "language",        limit: 255 # 语言，多个名字用｜分隔
# t.string   "company",         limit: 255 # 发行公司，多个名字用｜分隔
# t.text     "info",            limit: 65535 # 电影描述
# t.string   "picAddr",         limit: 255 # 图片地址
# t.string   "dimensional",     limit: 255 # 电影维度类型（2D／3D／IMAX）
# t.string   "shortInfo",       limit: 255 # 电影一句话简介
# t.string   "videoUrl",        limit: 255 # 电影预告片ID，全部来自优酷，请参考youku开放平台
# t.string   "grade",           limit: 255 # 电影评分