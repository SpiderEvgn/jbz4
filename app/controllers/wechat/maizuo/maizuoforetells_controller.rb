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
