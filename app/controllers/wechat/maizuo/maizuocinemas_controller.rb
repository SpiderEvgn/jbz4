class Wechat::Maizuo::MaizuocinemasController < ApplicationController
  # before_action :getCinemaInfo
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读

  def index
    @cinemas = Maizuocinema.all.paginate(:page => params[:page], :per_page => 5)
  end

  private 
    def getCinemaInfo
      @cinemas = Maizuocinema.getCinemas
      @cinemas.each do |cinema|
        c = Maizuocinema.new
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
      end
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
