class Wechat::Maizuo::ApisController < ApplicationController
  layout 'wechat'
  
  D1 = Time.now.to_s[0,10]             # 当天的日期
  D2 = (Time.now + 86400).to_s[0,10]   # 明天的日期
  D3 = (Time.now + 86400*2).to_s[0,10] # 后天的日期

  def index
    
  end
 
  def delete
    Wechat::Maizuo::Cinema.delete_all
    Wechat::Maizuo::Film.delete_all
    Wechat::Maizuo::Foretell.delete_all
    Wechat::Jbzlocal::Cinema.delete_all
    Wechat::Jbzlocal::Hotfilm.delete_all
    Wechat::Jbzlocal::Foretell.delete_all
  end
  
  def getCinemaInfo
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

  def getFilmInfo
    if @films = Wechat::Maizuo::Film.getFilms
      # 如果返回为nil，即本次查询失败，进入下一个循环
      @films.each do |film|
        f = Wechat::Maizuo::Film.new

        f.filmId = film['id']
        f.name = film['name']
        f.director = film['director']
        f.actors = film['actors']
        f.filmType = film['type']
        f.area = film['area']
        f.length = film['length']
        f.releaseDate = film['releaseDate']
        f.isShow = film['isShow']
        f.language = film['language']
        f.company = film['company']
        f.info = film['info']
        f.picAddr = film['picAddr']
        f.dimensional = film['dimensional']
        f.shortInfo = film['shortInfo']
        f.videoUrl = film['videoUrl']
        f.grade = film['grade']

        f.save
      # @films.each do |film|
      end
    # if @films
    end
  # def getFilmInfo
  end


  def getForetellInfo
    # 优先级：1
    @cinemas = Wechat::Maizuo::Cinema.all
    @cinemas.each do |cinema|
      if @foretells = Wechat::Maizuo::Foretell.getForetells(cinema.cinemaId)
      # 如果返回为nil，即本次查询失败，进入下一个循环
        @foretells.each do |ft|
          # sd = ft['showDate'].gsub(/-/,'')
          # 原来卖座的 showDate 是 YY-mm-dd 的格式，后来“－”去掉了，又加上了，f***
          sd = ft['showDate']
          ft['foretells'].each do |ftrow|
            f = Wechat::Maizuo::Foretell.new

            f.cinemaId = cinema.cinemaId
            f.showDate = sd
            f.showTime = ftrow['showTime']
            f.hallId = ftrow['hallId']
            f.hallName = ftrow['hallName']
            f.foretellId = ftrow['foretellId']
            f.filmId = ftrow['filmId']
            f.price = ftrow['price']
            f.marketPrice = ftrow['marketPrice']
            f.flag = ftrow['flag']
            f.language = ftrow['language']
            f.duration = ftrow['duration']
            f.timeout = ftrow['timeout']
            f.sectionId = ftrow['sectionId']
            f.dimensional = ftrow['dimensional']
            f.offerId = ftrow['offerId']
            f.lockNeedMobile = ftrow['lockNeedMobile']

            f.save
          # ft['foretells'].each do |ftrow|
          end
        # @foretells.each do |ft|
        end
      # if @foretells
      end
    # @cinemas.each do |cinema|
    end
  # def getForetellInfo
  end

  def getJbzForetellInfo
    # 优先级：2
    @maizuoforetells = Wechat::Maizuo::Foretell.where("showDate = ? OR showDate = ? OR showDate = ?", "#{D1}", "#{D2}", "#{D3}").all
    # 先通过今、明、后三天的日期筛选出排期表中所有在最近三天排期数据，存入到本地 jbzforetell 排期
    @maizuoforetells.each do |mzft|
      f = Wechat::Jbzlocal::Foretell.new

      f.cinemaId = mzft.cinemaId
      f.showDate = mzft.showDate
      f.showTime = mzft.showTime

      f.hallId = mzft.hallId
      f.hallName = mzft.hallName
      f.foretellId = mzft.foretellId
      f.filmId = mzft.filmId
      f.price = mzft.price
      f.marketPrice = mzft.marketPrice
      f.flag = mzft.flag
      f.language = mzft.language
      f.duration = mzft.duration
      f.timeout = mzft.timeout
      f.sectionId = mzft.sectionId
      f.dimensional = mzft.dimensional
      f.offerId = mzft.offerId
      f.lockNeedMobile = mzft.lockNeedMobile

      f.save
    # @maizuoforetells.each do |mzft|
    end
  # def getJbzforetellInfo
  end

  def getJbzHotfilmInfo
    # 优先级：3
    @jbzhotfilmIds = Wechat::Jbzlocal::Foretell.select(:filmId).uniq
    # 从已有的 Jbzforetells 表中取出所有在最近三天热映的电影，然后对 filmId 取 uniq 值，得到一个数组
    @jbzhotfilmIds.each do |mzfid|
      jbzfid = mzfid.filmId   # 将数组中的 filmId 值取出，用作以下到电影库中比对并存入 jbzhotfilm 表
      if @maizuofilm = Wechat::Maizuo::Film.find_by_filmId("#{jbzfid}")
      # 检查排期中的电影是否在影片库中存在
        f = Wechat::Jbzlocal::Hotfilm.new

        f.filmId = jbzfid
        f.name = @maizuofilm.name
        f.director = @maizuofilm.director
        f.actors = @maizuofilm.actors
        f.filmType = @maizuofilm.filmType
        f.area = @maizuofilm.area
        f.length = @maizuofilm.length
        f.releaseDate = @maizuofilm.releaseDate
        f.isShow = @maizuofilm.isShow
        f.language = @maizuofilm.language
        f.company = @maizuofilm.company
        f.info = @maizuofilm.info
        f.picAddr = @maizuofilm.picAddr
        f.dimensional = @maizuofilm.dimensional
        f.shortInfo = @maizuofilm.shortInfo
        f.videoUrl = @maizuofilm.videoUrl
        f.grade = @maizuofilm.grade

        f.save
      # if
      end
    # @jbzfilmIds.each do |fi|
    end
  # def getJbzfilmInfo
  end

end