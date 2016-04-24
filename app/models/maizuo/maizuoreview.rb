class Maizuo::Maizuoreview < ActiveRecord::Base
  include HTTParty

  # 测试地址需要改变地址 /etc/hosts:  115.29.236.48  open.maizuo.com
  base_uri "http://open.maizuo.com"
  
  # default_params  暂且没有默认参数，注释掉以备将来之用
  format :json
  
  # debug_output 用来在 console 输出 api 调用过程
  debug_output $stdout
  # default_timeout 5

  def self.getReviews(filmId)
    # 12. 拉取影评
    client_id = ENV['JBZ4_MAIZUO_CLIENT_ID']  # 测试ID: 52642103681
    key = ENV['JBZ4_MAIZUO_KEY']  # 测试key: xkGEr244(((<HAee4346fg
    time = Time.new
    timestamp = time.strftime("%Y%m%d%H%M%S")
    sign_value = Digest::MD5.hexdigest("client_id=#{client_id}&filmId=#{filmId}&timestamp=#{timestamp}&key=#{key}")
    response = get("/rest/ticket3.0/reviews", query: { client_id: "#{client_id}",  
	                                                     sign: "#{sign_value}",
	                                                     timestamp: "#{timestamp}",
	                                                     filmId: "#{filmId}"
	                                                     # count: "5"
	                                                     })
    # 判断返回值是否正确
    if response['result'] == 0 || response['result'] == "0"
      return response['data']
    else
      return nil
    end
  end
end

# t.string   "filmId",         limit: 255 # 电影ID
# t.string   "reviewId",       limit: 255 # 影评ID（文档中是feedId，感觉用 review 更好）
# t.string   "author",         limit: 255 # 影评作者
# t.string   "authorHeadPic",  limit: 255 # 影评作者头像
# t.string   "filmPic",        limit: 255 # 电影海报
# t.string   "reviewTime",     limit: 255 # 评论时间（毫秒）
# t.string   "reviewContent",  limit: 255 # 评论内容
