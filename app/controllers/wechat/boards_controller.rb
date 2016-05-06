class Wechat::BoardsController < ApplicationController
  layout 'wechat'

  def jbz_hotfilm
    # 判定是否座位锁但未确认订单的，如果是则解锁座位
    if @lock = Wechat::Maizuo::Lock.find_by_foretellId(session[:foretellId])
      if @lock.isOrder != "Y"
        Wechat::Maizuo::Lock.unlockSeats(@lock.orderId)
      end
    end
    session[:cinemaId] = nil
    session[:filmId] = nil
    session[:foretellId] = nil
    session[:orderId] = nil
    @films = Wechat::Jbzlocal::Hotfilm.all
  end

  def jbz_filtercinema
  	# 影院筛选页面，还没想好怎么设计
  end

  def jbz_cinema
    # 判定是否座位锁但未确认订单的，如果是则解锁座位
    if @lock = Wechat::Maizuo::Lock.find_by_foretellId(session[:foretellId])
      if @lock.isOrder != "Y"
        Wechat::Maizuo::Lock.unlockSeats(@lock.orderId)
      end
    end
    session[:cinemaId] = nil
    session[:filmId] = nil
    session[:foretellId] = nil
    session[:orderId] = nil
    @cinemas = Wechat::Jbzlocal::Cinema.all.paginate(:page => params[:page], :per_page => 30)
  end

end
