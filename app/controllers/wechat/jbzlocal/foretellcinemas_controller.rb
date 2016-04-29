class Wechat::Jbzlocal::ForetellcinemasController < ApplicationController
  layout 'wechat'
  
  d1 = Time.new.strftime("%d")     # 当日的天数
  d2 = (d1.to_i + 1).to_s          # 明日的天数
  d3 = (d2.to_i + 1).to_s          # 后日的天数
  D1 = String.new("2016-04-#{d1}") # 当天的日期
  D2 = String.new("2016-04-#{d2}") # 明天的日期
  D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）
  # 卖座改了日期的格式，没有－了,f***
  # D1 = Time.new.strftime("%Y%m%d")
  # D2 = (D1.to_i + 1).to_s
  # D3 = (D2.to_i + 1).to_s
    
  def show
    # 页面顶部仍然保留当前影院信息
    @jbzcinema = Wechat::Jbzlocal::Cinema.find_by_cinemaId(params[:id])
    # 页面中部显示当前选中的影片
    @jbzhotfilm = Wechat::Jbzlocal::Hotfilm.find_by_filmId(session[:filmId])
    # 影院在映影片中点击一部影片后，把该电影ID传过来，启用 show 来显示完整三天排期信息
    @Day1 = D1
    @Day2 = D2
    @Day3 = D3
    @jbzforetells_D1 = Wechat::Jbzlocal::Foretell.where(cinemaId: params[:id], filmId: session[:filmId], showDate: "#{D1}").order("showTime").all
    @jbzforetells_D2 = Wechat::Jbzlocal::Foretell.where(cinemaId: params[:id], filmId: session[:filmId], showDate: "#{D2}").order("showTime").all
    @jbzforetells_D3 = Wechat::Jbzlocal::Foretell.where(cinemaId: params[:id], filmId: session[:filmId], showDate: "#{D3}").order("showTime").all
  end
    
end