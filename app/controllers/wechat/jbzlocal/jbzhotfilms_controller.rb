class Wechat::Jbzlocal::JbzhotfilmsController < ApplicationController
  layout 'wechat'

  def show
  	# 在热映电影列表点击一部电影后，把该电影ID传过来，启用 show 来显示该电影完整信息
    @jbzhotfilm = Jbzhotfilm.find_by_filmId(params[:id])
    session[:filmId] = params[:id]
  end
  
end