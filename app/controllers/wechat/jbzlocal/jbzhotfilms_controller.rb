class Wechat::Jbzlocal::JbzhotfilmsController < ApplicationController
  layout 'wechat'
  # before_action :getJbzhotfilmInfo
  # 这个 action 用来自动获取最近三天热映的电影信息并存入 jbzhotfilms 表
  # 还没想明白怎么很好地从api拉取数据并导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读
  
  def show
  	# 在热映电影列表点击一部电影后，把该电影ID传过来，启用 show 来显示该电影完整信息
    @jbzhotfilm = Jbzhotfilm.find_by_filmId(params[:id])
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
    	Jbzhotfilm.destroy_all
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

    # strong_params 没有用到，暂且保留
    # def jbzhotfilm_params
    #   params.require(:jbzhotfilm).permit(:name, :director, :actors, :filmType,
    #                                      :area, :length, :releaseDate, :dimensional,
    #                                      :shortInfo)
    # end
end