class Wechat::Jbzlocal::RealtimeseatsController < ApplicationController
  layout 'wechat'

  def show
    # 把 foretellId 传进来，调用 realTimeSeat 接口获取实时座位 JSON
    response = Wechat::Maizuo::Realtimeseat.getRealTimeSeats(params[:id])

    # 场次获取失败则跳回选票界面并提示错误 
    if response['result'] == 0 || response['result'] == "0"
      @seatresource = response.to_json
      session[:foretellId] = params[:id]
    else
      redirect_to :back, notice: "场次无效，请重新选择，谢谢！"
    end
  end

  def create
    
    @seats = params[:seats]['seatId'].gsub(/ /, '|')
    # @seats.gsub(/ /,'')
    @foretell = Wechat::Jbzlocal::Foretell.find_by_foretellId(session[:foretellId])

    if Wechat::Maizuo::Lock.lockSeats("odNum0060", session[:foretellId], @seats, "1", @foretell.price, "13916247381")
      # 座位锁定
      redirect_to wechat_jbzlocal_order_url(@seats)
    else
      redirect_to :back, notice: "锁座失败，请重新选择，谢谢！"
    end
  end

end