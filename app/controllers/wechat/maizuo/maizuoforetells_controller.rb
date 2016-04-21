class Wechat::Maizuo::MaizuoforetellsController < ApplicationController
  # before_action :getForetellInfo
  # 还没想明白怎么很好地从api拉取数据并导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读

  # before_action :getJbzhotfilmInfo
  # 这个 action 用来自动获取最近三天热映的电影信息并存入 jbzhotfilms 表
  
  def index
    @foretells = Maizuoforetell.all.paginate(:page => params[:page], :per_page => 12)
  end

  private 
    # 考虑将以下自动获取热映电影代码放入 jbzhotfilm 的 model 里面去，下次 commit
    d1 = Time.new.strftime("%d")     # 当日的天数
    d2 = (d1.to_i + 1).to_s          # 明日的天数
    d3 = (d2.to_i + 1).to_s          # 后日的天数
    D1 = String.new("2016-04-#{d1}") # 当天的日期
    D2 = String.new("2016-04-#{d2}") # 明天的日期
    D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）

    def getJbzhotfilmInfo
      @jbzfilmIds = Maizuoforetell.where("showDate = ? OR showDate = ? OR showDate = ?", "#{D1}", "#{D2}", "#{D3}").select(:filmId).uniq
      # 先通过今、明、后三天的日期筛选出排期表中所有在最近三天热映的电影，然后对 filmId 取 uniq 值，得到一个 hash
      @jbzfilmIds.each do |mzfid|
        jbzfid = mzfid.filmId   # 将hash数组中的 filmId 值取出，用作以下到电影库中比对并存入 jbzhotfilm 表
        @maizuofilm = Maizuofilm.find_by_filmId("#{jbzfid}")
        f = Jbzhotfilm.new

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


    def getForetellInfo
      @cinemas = Maizuocinema.all
      @cinemas.each do |cinema|
        @foretells = Maizuoforetell.getForetells(cinema.cinemaId)
        if @foretells != nil 
        # 如果返回为nil，即本次查询失败，进入下一个循环
          @foretells.each do |ft|
            sd = ft['showDate'].gsub(/-/,'')
            ft['foretells'].each do |ftrow|
              f = Maizuoforetell.new

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
        # if @foretells != nil
        end
      # @cinemas.each do |cinema|
      end
    # def getForetellInfo
    end

end
