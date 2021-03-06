class Wechat::Maizuo::HallseatsController < ApplicationController
  before_action :getHallseatInfo
  # 大约要跑两个小时
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读

  def index
    @hallseats = Wechat::Maizuo::Hallseat.all.paginate(:page => params[:page], :per_page => 12)
  end

  private 
    def getHallseatInfo
      @cinemas = Wechat::Maizuo::Cinema.all
      @cinemas.each do |cinema|
        if cinema.hallId
          cinema.hallId.split('-').each do |hallId|
            @hallseats = Wechat::Maizuo::Hallseat.getHallseats(cinema.cinemaId, hallId)
            if @hallseats != nil 
            # 如果返回为nil，即本次查询失败，进入下一个循环
              @hallseats.each do |hs|
                h = Wechat::Maizuo::Hallseat.new
                
                h.cinemaId = cinema.cinemaId
                h.hallId = hallId
                h.seatId = hs['seatId']
                h.sectionId = hs['sectionId']
                h.rowId = hs['rowId']
                h.rowNum = hs['rowNum']
                h.columnId = hs['columnId']
                h.columnNum = hs['columnNum']
                h.damagedFlag = hs['damagedFlag']
                h.loveIndex = hs['loveIndex']

                h.save
              # @hallseats.each
              end
            # if @hallseats != nil
            end
          # cinema.hallid.split
          end
        # if cinema.hallId
        end
      # @cinemas.each do |cinema|
      end
    # def getHallseatInfo
    end
    
end