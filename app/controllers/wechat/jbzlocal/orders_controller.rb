class Wechat::Jbzlocal::OrdersController < ApplicationController
  layout 'wechat'

  def index
    @jbzcinema = Wechat::Jbzlocal::Cinema.find_by_cinemaId(session[:cinemaId])
    @jbzhotfilm = Wechat::Jbzlocal::Hotfilm.find_by_filmId(session[:filmId])
    @lock = Wechat::Maizuo::Lock.find_by_orderId(session[:orderId])
  end

  def show
    @lock = Wechat::Maizuo::Lock.find_by_orderId(params[:id])
    if response = Wechat::Maizuo::Confirmorder.confirmOrder(@lock.orderId, 
                                                            @lock.count, 
                                                            @lock.price,
                                                            @lock.totalprice,
                                                            @lock.mobile)
      order = Wechat::Jbzlocal::Order.new
      order.orderId = @lock.orderId
      order.offerId = response['offerId']
      order.confirmId = response['confirmId']
      order.offerOrderId = response['offerOrderId']
      order.thirdConfirmId = response['thirdConfirmId']
      order.takeTicketPostion = response['takeTicketPostion']
      order.smTemplate = response['smTemplate']
      order.isCheckGround = response['isCheckGround']
      order.seatType = response['seatType']
      order.mobile = @lock.mobile
      order.platformId = "1"
      # 以后会做 orderId 的查重，做 save 的判断，防止用户重复确认订单
      order.save
      # 订单确认后，将该订单对应的 lock 记录 isOrder 字段更新为 Y
      @lock.update(isOrder:"Y")

      @order = Wechat::Jbzlocal::Order.find_by_orderId(params[:id])
    else
      redirect_to :back, notice: "下单失败，请再次确认，谢谢！"
    end

  end

end