class Maizuoforetell < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.getForetells(cinemaId)
    # 4. 拉取影院排期
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("cinemaId=#{cinemaId}&client_id=#{client_id}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket4.0/foretells", query: { client_id: "#{client_id}",  
                                                         sign: "#{sign_value}",
                                                         timestamp: "#{timestamp}",
                                                         cinemaId: "#{cinemaId}"
                                                         })
    # 判断返回值是否正确
    if response['result'] == 0 || response['result'] == "0"
      return response['data']
    else
      return nil
    end
  end
end

# t.string   "cinemaId",       limit: 255 # 影院ID
# t.string   "showDate",       limit: 255 # 放映日期 yyyy-mm-dd
# t.string   "showTime",       limit: 255 # 放映时间 hhmm（电子票必填）
# t.string   "hallId",         limit: 255 # 厅号
# t.string   "hallName",       limit: 255 # 厅名
# t.string   "foretellId",     limit: 255 # 场次Id
# t.string   "filmId",         limit: 255 # 电影Id
# t.string   "price",          limit: 255 # 价格
# t.string   "marketPrice",    limit: 255 # 市场价
# t.string   "flag",           limit: 255 # 连场标记（Y/N）
# t.string   "language",       limit: 255 # 语言
# t.string   "duration",       limit: 255 # 放映时长（分钟）
# t.string   "timeout",        limit: 255 # 提前多少分钟挺卖（分钟）
# t.string   "sectionId",      limit: 255 # 厅区域iD
# t.string   "dimensional",    limit: 255 # 影片纬度（2D/3D/IMAX）
# t.string   "offerId",        limit: 255 # 提供商（0:表示非订座的电子票排期 1:火凤凰 2、3:满天星 4:虚拟订座 5:蜘蛛网 6:华南火凤 7:万达）
# t.string   "lockNeedMobile", limit: 255 # 锁座位传电话号码（0:不需要 1:必须传）
