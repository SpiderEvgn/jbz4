class Maizuo::Maizuohallseat < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.getHallseats(cinemaId, hallId)
    # 14. 拉取影厅的基础座位图
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("cinemaId=#{cinemaId}&client_id=#{client_id}&hallId=#{hallId}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket3.0/hallSeat", query: { client_id: "#{client_id}",
                                                        sign: "#{sign_value}",
                                                        timestamp: "#{timestamp}", 
                                                        cinemaId: "#{cinemaId}",
                                                        hallId: "#{hallId}"
                                                        })
    # 判断返回值是否正确
    if response['result'] == 0 || response['result'] == "0"
      return response['data']['seatList']
    else
      return nil
    end
  end

end

# t.string   "cinemaId",    limit: 255 # 影院ID
# t.string   "hallId",      limit: 255 # 影厅ID
# t.string   "seatId",      limit: 255 # 座位ID
# t.string   "sectionId",   limit: 255 # 影厅区域
# t.string   "rowId",       limit: 255 # 行编号
# t.string   "rowNum",      limit: 255 # 行号（座位位置图的 y 坐标）
# t.string   "columnId",    limit: 255 # 列编号
# t.string   "columnNum",   limit: 255 # 列好（座位位置图的 x 坐标）
# t.string   "damagedFlag", limit: 255 # 座位损坏标志（Y/N）
# t.string   "loveIndex",   limit: 255 # 情侣座标志（0:非情侣座 1、2:情侣首位座）


