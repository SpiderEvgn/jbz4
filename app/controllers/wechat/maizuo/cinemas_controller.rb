class Wechat::Maizuo::CinemasController < ApplicationController
  layout 'wechat'
  
  def index
    
  end
 
  def delete
    Wechat::Maizuo::Cinema.delete_all
    Wechat::Maizuo::Film.delete_all
    Wechat::Maizuo::Foretell.delete_all
    Wechat::Maizuo::Review.delete_all
    Wechat::Jbzlocal::Cinema.delete_all
    Wechat::Jbzlocal::Hotfilm.delete_all
    Wechat::Jbzlocal::Foretell.delete_all
  end
  
  def getCinemaInfo
    # Wechat::Maizuo::Cinema.delete_all
    # 这个 delete_all 包括 destroy_all 会导致以下接口无效，很奇怪
    @cinemas = Wechat::Maizuo::Cinema.getCinemas
    if @cinemas != nil 
      # 如果返回为nil，即本次查询失败，进入下一个循环
      @cinemas.each do |cinema|
        c = Wechat::Maizuo::Cinema.new
        
        c.cityId = cinema['cityId']
        c.cityName = cinema['cityName']
        c.cinemaId = cinema['cinemaId']
        c.cinemaName = cinema['cinemaName']
        c.logo = cinema['logo']
        c.address = cinema['address']
        c.region = cinema['region']
        c.phone = cinema['phone']
        c.hallId = cinema['hallId']
        c.hallNames = cinema['hallNames']
        c.seatCounts = cinema['seatCounts']
        c.vipflags = cinema['vipflags']
        c.ticketFlag = cinema['ticketFlag']
        c.seatFlag = cinema['seatFlag']
        c.busPath = cinema['busPath']
        c.subway = cinema['subway']
        c.businessCircle = cinema['businessCircle']
        c.longitude = cinema['longitude']
        c.latitude = cinema['latitude']
        
        c.save
      # @cinemas.each do |cinema|
      end
    # if @cinemas != nil
    end
    
    # 以下将从卖座拿来的影院数据，从 Wechat::Maizuo::Cinemas 导入到 jbzcinemas
    @mzcinemas = Wechat::Maizuo::Cinema.all
    @mzcinemas.each do |cinema|
      c = Wechat::Jbzlocal::Cinema.new

      c.cityId = cinema.cityId
      c.cityName = cinema.cityName
      c.cinemaId = cinema.cinemaId
      c.cinemaName = cinema.cinemaName
      c.logo = cinema.logo
      c.address = cinema.address
      c.region = cinema.region
      c.phone = cinema.phone
      c.hallId = cinema.hallId
      c.hallNames = cinema.hallNames
      c.seatCounts = cinema.seatCounts
      c.vipflags = cinema.vipflags
      c.ticketFlag = cinema.ticketFlag
      c.seatFlag = cinema.seatFlag
      c.busPath = cinema.busPath
      c.subway = cinema.subway
      c.businessCircle = cinema.businessCircle
      c.longitude = cinema.longitude
      c.latitude = cinema.latitude
      
      c.save
    # @mzcinemas.each do |cinema|
    end
  # def getCinemaInfo
  end

end
