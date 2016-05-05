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
    session[:seatNo] = params[:seats]['seatNo']
    # 记录座位名称，以备之后确认订单使用
    session[:mobile] = params[:seats]['mobile']
    # 记录手机号，以备之后确认订单使用
    @seats = params[:seats]['seatId'][0..-2].gsub(/ /, '|')
    # 调整座位号的格式
    session[:seatId] = @seats
    # 记录座位Id，以备将来 unlock 座位用
    @count = @seats.count('|') + 1
    session[:count] = @count
    # 计算座位数量
    @foretell = Wechat::Jbzlocal::Foretell.find_by_foretellId(session[:foretellId])
    # 取出选定的场次信息
    time = Time.new.strftime("%Y%m%d%H%M")
    keys = ""
    4.times{
      key = Random.rand(9).to_s
      keys += key
    }
    @orderId = "jbz" + time + "SN" + keys
    session[:orderId] = @orderId
    if Wechat::Maizuo::Lock.lockSeats(@orderId, session[:foretellId], @seats, @count, @foretell.price, session[:mobile])
      # 座位锁定
      redirect_to wechat_jbzlocal_orders_url
    else
      redirect_to :back, notice: "锁座失败，请重新选择，谢谢！"
    end
  end

end