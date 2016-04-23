class Wechat::Jbzlocal::JbzforetellsController < ApplicationController
  layout 'wechat'
  
  before_action :getJbzforetellInfo
  # 这个 action 用来自动获取最近三天热映的电影信息并存入 jbzhotfilms 表
  # 还没想明白怎么很好地从api拉取数据并导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读
  
  def show
  	# 在热映电影列表点击一部电影后，把该电影ID传过来，启用 show 来显示该电影完整信息
    # @jbzforetell = Jbzforetell.find_by_filmId(params[:id])
  end

  private 
    # 考虑将以下自动获取最近三天排期的代码放入 jbzforetell 的 model 里面去，下次 commit
    d1 = Time.new.strftime("%d")     # 当日的天数
    d2 = (d1.to_i + 1).to_s          # 明日的天数
    d3 = (d2.to_i + 1).to_s          # 后日的天数
    D1 = String.new("2016-04-#{d1}") # 当天的日期
    D2 = String.new("2016-04-#{d2}") # 明天的日期
    D3 = String.new("2016-04-#{d3}") # 后天的日期（查最近三天的热映电影）

    def getJbzforetellInfo
    	# Jbzforetell.destroy_all
      @maizuoforetells = Maizuoforetell.where("showDate = ? OR showDate = ? OR showDate = ?", "#{D1}", "#{D2}", "#{D3}").all
      # 先通过今、明、后三天的日期筛选出排期表中所有在最近三天排期数据，存入到本地 jbzforetell 排期
      @maizuoforetells.each do |mzft|
        f = Jbzforetell.new

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

end