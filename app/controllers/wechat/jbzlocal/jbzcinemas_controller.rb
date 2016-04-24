class Wechat::Jbzlocal::JbzcinemasController < ApplicationController
  layout 'wechat'
  
  def index
    # 显示正在热映选中影片的所有影院
    # @jbzcinemas = Jbzforetell.where(filmId: session[:filmId]).select(:cinemaId).uniq
  end

  def show
    # 在影院列表点击一个影院后，把该影院ID传过来，启用 show 来显示该影院和排期的完整信息
    # 用来显示影院详情
    @jbzcinema = Jbzcinema.find_by_cinemaId(params[:id])
    session[:cinemaId] = params[:id]

    # 显示热映影片列表
    @jbzforetells = Jbzforetell.where(cinemaId: params[:id]).select(:filmId).uniq
  end
    
end