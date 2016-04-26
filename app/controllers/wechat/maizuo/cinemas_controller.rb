class Wechat::Maizuo::CinemasController < ApplicationController
  before_action :getCinemaInfo
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读
  layout 'wechat'
  
  def index
    @cinemas = Wechat::Maizuo::Cinema.all.paginate(:page => params[:page], :per_page => 4)
  end

  private 
    def getCinemaInfo
      # Maizuo::Cinema.delete_all
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

    # 应该用不到 strong params，因为数据不可本地改写
    # def cinema_params
    #   params.require(:cinema).permit(:cityId, :cityName, :cinemaId, :cinemaName,
    #                                  :logo, :address, :region, :phone, :hallId,
    #                                  :hallNames, :seatCounts, :vipflags, :ticketFlag,
    #                                  :seatFlag, :busPath, :subway, :businessCircle,
    #                                  :longitude, :latitude)
    # end
end
