class Wechat::BoardsController < ApplicationController
  layout 'wechat'

  # before_action :getJbzforetellInfo
  # 这个 action 用来从 maizuoforetells 获取最近三天的排期数据并存入 jbzforetells 表
  # before_action :getJbzhotfilmInfo
  # 这个 action 用来自动获取最近三天热映的电影信息并存入 jbzhotfilms 表
  # 还没想明白怎么很好地从api拉取数据并导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读

  def jbz_hotfilm
    session[:cinemaId] = nil
    session[:filmId] = nil
    @films = Jbzlocal::Jbzhotfilm.all
  end

  def jbz_filtercinema
  	# 影院筛选页面，还没想好怎么设计
  end

  def jbz_cinema
    session[:cinemaId] = nil
    session[:filmId] = nil
  	# @cinemas = Maizuocinema.all
    @cinemas = Jbzlocal::Jbzcinema.all.paginate(:page => params[:page], :per_page => 30)
  	# 还没建立 Jbzcinema, 暂用 Maizuocinema
  end

  private
    # 考虑将以下自动获取热映电影代码放入 jbzhotfilm 的 model 里面去，下次 commit
    # d1 = Time.new.strftime("%d")     # 当日的天数
    # d2 = (d1.to_i + 1).to_s          # 明日的天数
    # d3 = (d2.to_i + 1).to_s          # 后日的天数
    # D1 = String.new("2016-04-#{d1}") # 当天的日期
    # D2 = String.new("2016-04-#{d2}") # 明天的日期
    # D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）
    # 卖座改了日期的格式，没有－了,f***
    D1 = Time.new.strftime("%Y%m%d")
    D2 = (D1.to_i + 1).to_s
    D3 = (D2.to_i + 1).to_s

    def getJbzforetellInfo
      Jbzlocal::Jbzforetell.delete_all
      @maizuoforetells = Maizuoforetell.where("showDate = ? OR showDate = ? OR showDate = ?", "#{D1}", "#{D2}", "#{D3}").all
      # 先通过今、明、后三天的日期筛选出排期表中所有在最近三天排期数据，存入到本地 jbzforetell 排期
      @maizuoforetells.each do |mzft|
        f = Jbzlocal::Jbzforetell.new

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
    
    def getJbzhotfilmInfo
      Jbzlocal::Jbzhotfilm.delete_all
      @jbzhotfilmIds = Jbzlocal::Jbzforetell.select(:filmId).uniq
      # 从已有的 Jbzforetells 表中取出所有在最近三天热映的电影，然后对 filmId 取 uniq 值，得到一个数组
      @jbzhotfilmIds.each do |mzfid|
        jbzfid = mzfid.filmId   # 将数组中的 filmId 值取出，用作以下到电影库中比对并存入 jbzhotfilm 表
        @maizuofilm = Maizuo::Maizuofilm.find_by_filmId("#{jbzfid}")
        f = Jbzlocal::Jbzhotfilm.new

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
      # @jbzfilmIds.each do |fi|
      end
    # def getJbzfilmInfo
    end

    # strong_params 没有用到，暂且保留
    # def jbzhotfilm_params
    #   params.require(:jbzhotfilm).permit(:name, :director, :actors, :filmType,
    #                                      :area, :length, :releaseDate, :dimensional,
    #                                      :shortInfo)
    # end

end
