class Wechat::Maizuo::MaizuocinematicketsController < ApplicationController
  # before_action :getCinemaTicketInfo
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读

  def index
    @cinemaTickets = Maizuocinematicket.all.paginate(:page => params[:page], :per_page => 12)
    # @cinemaTickets = CinemaTicket.all
    # @cinemas = Cinema.all
    # @cinemas[50].each do |cinema|
    # @cinemaTickets = Maizuocinematicket.getCinemaTickets(2471)
    # end
  end

  private 
    def getCinemaTicketInfo
      @cinemas = Maizuocinema.all
      @cinemas.each do |cinema|
        @cinemaTickets = Maizuocinematicket.getCinemaTickets(cinema.cinemaId)
        @cinemaTickets.each do |ct|
          c = Maizuocinematicket.new
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
        end
      end
    end
end
