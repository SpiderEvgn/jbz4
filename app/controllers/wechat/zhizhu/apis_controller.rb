class Wechat::Zhizhu::ApisController < ApplicationController
  layout 'wechat'
  
  def index

  end

  def delete
    Wechat::Zhizhu::City.delete_all
    Wechat::Zhizhu::Region.delete_all
    Wechat::Zhizhu::Cinema.delete_all
    # Hall 的接口非常长，而且不大会变，暂且注释不用
    # Wechat::Zhizhu::Hall.delete_all
  end

  def getCityInfo
    @citys = Wechat::Zhizhu::City.getCity
    if @citys != nil
      # 小心！判断返回值类型，如果只有一条记录，class就是Hash，多条记录就是Array
      if @citys.class == Array
        @citys.each do |city|
          c = Wechat::Zhizhu::City.new
          c.cityId   = city['cityId']
          c.cityName = city['cityName']
          c.cityType = city['cityType']
          c.save
        # @citys.each
        end
      else
        c = Wechat::Zhizhu::City.new
        c.cityId   = @citys['cityId']
        c.cityName = @citys['cityName']
        c.cityType = @citys['cityType']
        c.save
      # if @citys.class
      end
    # if @citys
    end
  # def getCityInfo
  end

  def getRegionInfo
    @citys = Wechat::Zhizhu::City.all
    @citys.each do |city|
      @regions = Wechat::Zhizhu::Region.getRegion(city.cityId)
      if @regions != nil
        # 小心！判断返回值类型，如果只有一条记录，class就是Hash，多条记录就是Array
        if @regions.class == Array
          @regions.each do |region|
            r = Wechat::Zhizhu::Region.new
            r.cityId     = city.cityId
            r.regionId   = region['regionId']
            r.regionName = region['regionName']
            r.save
          # @regions.each
          end
        else
          r = Wechat::Zhizhu::Region.new
          r.cityId     = city.cityId
          r.regionId   = @regions['regionId']
          r.regionName = @regions['regionName']
          r.save
        # if @regions.class
        end
      # if @regions
      end
    # @citys.each
    end
  # def getRegionInfo
  end

  def getCinemaInfo
    @citys = Wechat::Zhizhu::City.all
    @citys.each do |city|
      @cinemas = Wechat::Zhizhu::Cinema.getCinema(city.cityId)
      if @cinemas != nil
        # 小心！判断返回值类型，如果只有一条记录，class就是Hash，多条记录就是Array
        if @cinemas.class == Array
          @cinemas.each do |cinema|
            c = Wechat::Zhizhu::Cinema.new
            c.cityId       = cinema['cityId']
            c.regionId     = cinema['regionId']
            c.cinemaId     = cinema['cinemaId']
            c.cinemaName   = cinema['cinemaName']
            c.cinemaLogo   = cinema['cinemaLogo']
            c.cinemaAdd    = cinema['cinemaAdd']
            c.contact      = cinema['contact']
            c.getTicketWay = cinema['getTicketWay']
            c.endbuyDate   = cinema['endbuyDate']
            c.presaleDay   = cinema['presaleDay']
            c.longitude    = cinema['longitude']
            c.latitude     = cinema['latitude']
            c.save
          # @cinemas.each
          end
        else
          c = Wechat::Zhizhu::Cinema.new
          c.cityId       = @cinemas['cityId']
          c.regionId     = @cinemas['regionId']
          c.cinemaId     = @cinemas['cinemaId']
          c.cinemaName   = @cinemas['cinemaName']
          c.cinemaLogo   = @cinemas['cinemaLogo']
          c.cinemaAdd    = @cinemas['cinemaAdd']
          c.contact      = @cinemas['contact']
          c.getTicketWay = @cinemas['getTicketWay']
          c.endbuyDate   = @cinemas['endbuyDate']
          c.presaleDay   = @cinemas['presaleDay']
          c.longitude    = @cinemas['longitude']
          c.latitude     = @cinemas['latitude']
          c.save
        # if @cinemas
        end
      # if @cinemas
      end
    # @citys.each
    end
  # def getCinemaInfo
  end

  def getHallInfo
    @cinemas = Wechat::Zhizhu::Cinema.all
    @cinemas.each do |cinema|
      @halls = Wechat::Zhizhu::Hall.getHall(cinema.cinemaId)
      if @halls != nil
        # 小心！判断返回值类型，如果只有一条记录，class就是Hash，多条记录就是Array
        if @halls.class == Array
          @halls.each do |hall|
            h = Wechat::Zhizhu::Hall.new
            h.cinemaId  = hall['cinemaId']
            h.hallId    = hall['hallId']
            h.hallName  = hall['hallName']
            h.hallType  = hall['hallType']
            h.save
          # @halls.each
          end
        else
          h = Wechat::Zhizhu::Hall.new
          h.cinemaId   = @halls['cinemaId']
          h.hallId     = @halls['hallId']
          h.hallName   = @halls['hallName']
          h.hallType   = @halls['hallType']
          h.save
        # if @halls
        end
      # if @halls
      end
    # @cinemas.each
    end
  # def getHallInfo
  end

end