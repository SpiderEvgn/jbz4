class Wechat::Jbzlocal::ForetellfilmsController < ApplicationController
  layout 'wechat'
  
  D1 = Time.now.to_s[0,10]             # 当天的日期
  D2 = (Time.now + 86400).to_s[0,10]   # 明天的日期
  D3 = (Time.now + 86400*2).to_s[0,10] # 后天的日期（查最近三天的热映电影）
    
  def show
    # 页面顶部仍然保留当前影院信息
    @jbzcinema = Wechat::Jbzlocal::Cinema.find_by_cinemaId(session[:cinemaId])
    # 页面中部显示当前选中的影片
    @jbzhotfilm = Wechat::Jbzlocal::Hotfilm.find_by_filmId(params[:id])
    session[:filmId] = params[:id]
    # 影院在映影片中点击一部影片后，把该电影ID传过来，启用 show 来显示完整三天排期信息
    @Day1 = D1[5,5]
    @Day2 = D2[5,5]
    @Day3 = D3[5,5]
    @jbzforetells_D1 = Wechat::Jbzlocal::Foretell.where(cinemaId: session[:cinemaId], filmId: params[:id], showDate: "#{D1}").order("showTime").all
    @jbzforetells_D2 = Wechat::Jbzlocal::Foretell.where(cinemaId: session[:cinemaId], filmId: params[:id], showDate: "#{D2}").order("showTime").all
    @jbzforetells_D3 = Wechat::Jbzlocal::Foretell.where(cinemaId: session[:cinemaId], filmId: params[:id], showDate: "#{D3}").order("showTime").all
    # 取出当前时间，和 showTime 比较
    @timeNow = Time.new.strftime("%H%M")
  end

end