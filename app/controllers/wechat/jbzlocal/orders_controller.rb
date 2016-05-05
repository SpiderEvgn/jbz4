class Wechat::Jbzlocal::OrdersController < ApplicationController
  layout 'wechat'

  def index
    @jbzcinema = Wechat::Jbzlocal::Cinema.find_by_cinemaId(session[:cinemaId])
    @jbzhotfilm = Wechat::Jbzlocal::Hotfilm.find_by_filmId(session[:filmId])
    @foretell = Wechat::Jbzlocal::Foretell.find_by_foretellId(session[:foretellId])
    @orderId = session[:orderId]
    @mobile = session[:mobile]
    @seatNo = session[:seatNo]
    @price = @foretell.price
    @totalprice = @price.to_i * session[:count]
    session[:totalprice] = @totalprice
  end

  def show

    if @response = Wechat::Maizuo::Confirmorder.confirmOrder(params[:id], 
                                                             session[:count], 
                                                             session[:price], 
                                                             session[:totalprice], 
                                                             session[:mobile])
      
    else
      redirect_to :back, notice: "下单失败，请再次确认，谢谢！"
    end

  end

end