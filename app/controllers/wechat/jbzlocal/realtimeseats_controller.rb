class Wechat::Jbzlocal::RealtimeseatsController < ApplicationController
  layout 'wechat'

  def show
  	# 把 foretellId 传进来，调用 realTimeSeat 接口获取实时座位 JSON

  end

  def index
  	@seatresource = Wechat::Maizuo::Realtimeseat.getRealTimeSeats("1053015060").to_json
  end

end