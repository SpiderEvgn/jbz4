class Wechat::BoardsController < ApplicationController
  layout 'wechat'

  def jbz_hotfilm
    session[:cinemaId] = nil
    session[:filmId] = nil
    session[:foretellId] = nil
    session[:seatNo] = nil
    session[:mobile] = nil
    session[:count] = nil
    session[:orderId] = nil
    session[:price] = nil
    session[:totalprice] = nil
    @films = Wechat::Jbzlocal::Hotfilm.all
  end

  def jbz_filtercinema
  	# 影院筛选页面，还没想好怎么设计
  end

  def jbz_cinema
    session[:cinemaId] = nil
    session[:filmId] = nil
    session[:foretellId] = nil
    session[:seatNo] = nil
    session[:mobile] = nil
    session[:count] = nil
    session[:orderId] = nil
    session[:price] = nil
    session[:totalprice] = nil
    @cinemas = Wechat::Jbzlocal::Cinema.all.paginate(:page => params[:page], :per_page => 30)
  end

end
