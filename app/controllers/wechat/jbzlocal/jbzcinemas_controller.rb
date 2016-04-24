class Wechat::Jbzlocal::JbzcinemasController < ApplicationController
  layout 'wechat'
  
  def index
    # 当前选中影片的详情
    @jbzhotfilm = Jbzhotfilm.find_by_filmId(session[:filmId])
    # 显示选中影片的所有正在热映影院
    @jbzforetells = Jbzforetell.where(filmId: session[:filmId]).select(:cinemaId).uniq
  end

  def show
    # 在影院列表点击一个影院后，把该影院ID传过来，启用 show 来显示该影院和排期的完整信息
    # 用来显示影院详情
    @jbzcinema = Jbzcinema.find_by_cinemaId(params[:id])
    session[:cinemaId] = params[:id]

    # 显示选中影院下所有热映影片列表
    @jbzforetells = Jbzforetell.where(cinemaId: params[:id]).select(:filmId).uniq
  end

end