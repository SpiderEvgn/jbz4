class Wechat::Jbzlocal::RealtimeseatsController < ApplicationController
  layout 'wechat'

  def show
    # 把 foretellId 传进来，调用 realTimeSeat 接口获取实时座位 JSON
    @seatresource = Wechat::Maizuo::Realtimeseat.getRealTimeSeats(params[:id]).to_json
  end

  def create
    # @seats.seatId.gsub(/ /,'|')
  end

end