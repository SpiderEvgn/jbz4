class Wechat::Maizuo::CinematicketsController < ApplicationController
  # before_action :getCinemaTicketInfo
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读
  
  def index
    @cinemaTickets = Maizuo::Cinematicket.all.paginate(:page => params[:page], :per_page => 12)
    # @cinemaTickets = Maizuocinematicket.getCinemaTickets(2471)
  end

  private 
    def getCinemaTicketInfo
      @cinemas = Maizuo::Cinema.all
      @cinemas.each do |cinema|
        @cinemaTickets = Maizuo::Cinematicket.getCinemaTickets(cinema.cinemaId)
        if @cinemaTickets != nil 
        # 如果返回为nil，即本次查询失败，进入下一个循环
          @cinemaTickets.each do |ct|
            c = Maizuo::Cinematicket.new

            c.cinemaId = cinema.cinemaId
            c.ticketId = ct['ticketId']
            c.ticketType = ct['ticketType']
            c.ticketName = ct['ticketName']
            c.markerPrice = ct['markerPrice']
            c.price = ct['price']
            c.desc = ct['desc']
            c.enableDay = ct['enableDay']
            c.invalidationDate = ct['invalidationDate']
            c.effectiveBeginTime = ct['effectiveBeginTime']

            c.save
          # @cinemaTickets.each do |ct|
          end
        # if @cinemaTickets != nil
        end
      # @cinemas.each do |cinema|
      end
    # def getCinemaTicketInfo
    end

end
