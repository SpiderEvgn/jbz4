class Wechat::Jbzlocal::RealtimeseatsController < ApplicationController
  layout 'wechat'

  def show
    # 判定是否座位锁但未确认订单的，如果是则解锁座位
    if @lock = Wechat::Maizuo::Lock.find_by_orderId(session[:orderId])
      if @lock.isOrder == nil
        Wechat::Maizuo::Lock.unlockSeats(@lock.orderId)
      end
    end

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
    # 生成jbz订单号
    time = Time.new.strftime("%Y%m%d%H%M")
    keys = ""
    4.times{
      key = Random.rand(9).to_s
      keys += key
    }
    @orderId = "jbz" + time + "SN" + keys
    # 调整座位号的格式
    @seats = params[:seats]['seatId'][0..-2].gsub(/ /, '|')
    # 计算座位数量
    @count = @seats.count('|') + 1
    # 取出选定的场次信息
    @foretell = Wechat::Jbzlocal::Foretell.find_by_foretellId(session[:foretellId])
    # 判断锁座结果
    if Wechat::Maizuo::Lock.lockSeats(@orderId, session[:foretellId], @seats, @count, @foretell.price, params[:seats]['mobile'])
      session[:orderId] = @orderId
      lock = Wechat::Maizuo::Lock.new
      lock.orderId = @orderId
      lock.foretellId = session[:foretellId]
      lock.seatId = params[:seats]['seatNo'] # 这个 seatId是座位名，不是和卖座交互的座位ID
      lock.count = @count
      lock.price = @foretell.price
      lock.totalprice = @foretell.price.to_i * @count
      lock.mobile = params[:seats]['mobile']
      lock.save

      redirect_to wechat_jbzlocal_orders_url
      # 这个有问题，要把 orderID 传过去才可以！
    else
      redirect_to :back, notice: "选座失败，请重新选择，谢谢！"
    end

  end

end