class Wechat::Maizuo::ForetellsController < ApplicationController

  def getMaizuoForetellInfo
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

  # 考虑将以下自动获取热映电影代码放入 jbzhotfilm 的 model 里面去，下次 commit
  d1 = Time.new.strftime("%d")     # 当日的天数
  d2 = (d1.to_i + 1).to_s          # 明日的天数
  d3 = (d2.to_i + 1).to_s          # 后日的天数
  D1 = String.new("2016-04-#{d1}") # 当天的日期
  D2 = String.new("2016-04-#{d2}") # 明天的日期
  D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）
  # 卖座改了日期的格式，没有－了,f***
  # D1 = Time.new.strftime("%Y%m%d")
  # D2 = (D1.to_i + 1).to_s
  # D3 = (D2.to_i + 1).to_s

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
