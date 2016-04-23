class Wechat::Jbzlocal::JbzforetellsController < ApplicationController
  layout 'wechat'
  
  def show
  	# 在影院列表点击一个影院后，把该影院ID传过来，启用 show 来显示该影院和排期的完整信息
  	@jbzcinema = Maizuocinema.find_by_cinemaId(params[:id])
  	# 用来显示影院详情
    @jbzforetell = Jbzforetell.find_by_cinemaId(params[:id])
    # 用来显示排期详情
  end
    
end