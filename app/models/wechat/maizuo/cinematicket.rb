class Wechat::Maizuo::Cinematicket < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  # format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.getCinemaTickets(cinemaId)
    # 3. 拉取影院票品
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=#{client_id}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket3.0/cinemaTickets", query: { client_id:  "#{client_id}",  
                                                             sign:       "#{sign_value}",
                                                             timestamp:  "#{timestamp}",
                                                             cinemaId:   "#{cinemaId}"
                                                             })
    # 判断返回值是否正确
    if response['result'] == 0 || response['result'] == "0"
      return response['data']['tickets']
    else
      return nil
    end

  end
end

# t.string   "cinemaId",           limit: 255 # 影院ID
# t.string   "ticketId",           limit: 255 # 票品ID
# t.string   "ticketType",         limit: 255 # 1: 2D， 2: 3D
# t.string   "ticketName",         limit: 255 # 票品名
# t.string   "markerPrice",        limit: 255 # 市场价（分）
# t.string   "price",              limit: 255 # 销售价（分）
# t.string   "desc",               limit: 255 # 票品描述
# t.string   "enableDay",          limit: 255 # 有效天数
# t.string   "invalidationDate",   limit: 255 # 有效期的截止日期，当enableDay=0时，有效期以该字段为准
# t.string   "effectiveBeginTime", limit: 255 # 当enableDay=0时，此参数为电子票的开始有效时间