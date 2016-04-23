class Wechat::Jbzlocal::JbzcinemasController < ApplicationController
  layout 'wechat'
  
  d1 = Time.new.strftime("%d")     # 当日的天数
  d2 = (d1.to_i + 1).to_s          # 明日的天数
  d3 = (d2.to_i + 1).to_s          # 后日的天数
  D1 = String.new("2016-04-#{d1}") # 当天的日期
  D2 = String.new("2016-04-#{d2}") # 明天的日期
  D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）

  def show
    # 在影院列表点击一个影院后，把该影院ID传过来，启用 show 来显示该影院和排期的完整信息
    # 用来显示影院详情
    @jbzcinema = Jbzcinema.find_by_cinemaId(params[:id])
    session[:cinemaId] = params[:id]

    # 显示热映影片列表
    @jbzforetells = Jbzforetell.where(cinemaId: params[:id]).select(:filmId).uniq
  end
    
end