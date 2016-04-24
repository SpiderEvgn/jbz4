class Wechat::Jbzlocal::JbzforetellsController < ApplicationController
  layout 'wechat'
  
  d1 = Time.new.strftime("%d")     # 当日的天数
  d2 = (d1.to_i + 1).to_s          # 明日的天数
  d3 = (d2.to_i + 1).to_s          # 后日的天数
  D1 = String.new("2016-04-#{d1}") # 当天的日期
  D2 = String.new("2016-04-#{d2}") # 明天的日期
  D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）
    
  def show
    # 页面顶部仍然保留当前影院信息
    @jbzcinema = Jbzcinema.find_by_cinemaId(session[:cinemaId])
    # 页面中部显示当前选中的影片
    @jbzhotfilm = Jbzhotfilm.find_by_filmId(params[:id])
    # 影院在映影片中点击一部影片后，把该电影ID传过来，启用 show 来显示完整三天排期信息
    @Day1 = D1
    @Day2 = D2
    @Day3 = D3
    @jbzforetells_D1 = Jbzforetell.where(cinemaId: session[:cinemaId], filmId: params[:id], showDate: "#{D1}").order("showTime").all
    @jbzforetells_D2 = Jbzforetell.where(cinemaId: session[:cinemaId], filmId: params[:id], showDate: "#{D2}").order("showTime").all
    @jbzforetells_D3 = Jbzforetell.where(cinemaId: session[:cinemaId], filmId: params[:id], showDate: "#{D3}").order("showTime").all
  end
    
end