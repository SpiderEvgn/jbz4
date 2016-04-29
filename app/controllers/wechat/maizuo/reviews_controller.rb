class Wechat::Maizuo::ReviewsController < ApplicationController
  # before_action :getReviewInfo
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读
  
  def index
    # @reviews = Wechat::Maizuo::Review.all.paginate(:page => params[:page], :per_page => 20)
    # @reviews = Wechat::Maizuo::Review.getReviews(2872)  # 测试用
    @reviews = Wechat::Maizuo::Review.all
  end

  private 
    def getReviewInfo
      # Wechat::Maizuo::Review.delete_all
      @films = Wechat::Jbzlocal::Hotfilm.all
      @films.each do |film|
        @reviews = Wechat::Maizuo::Review.getReviews(film.filmId)
        if @reviews != nil 
          # 如果返回为nil，即本次查询失败，进入下一个循环
          @reviews.each do |review|
            r = Wechat::Maizuo::Review.new

            r.filmId = film.filmId
            r.reviewId = review['feedId']
            r.author = review['author']
            r.authorHeadPic = review['authorHeadPic']
            r.filmPic = review['filmPic']
            r.reviewTime = review['reviewTime']
            r.reviewContent = review['reviewContent']

            r.save
          # @reviews.each do |review|
          end
        # if @reviews != nil
        end
      # @films = Jbzhotfilm.all
      end
    # def getReviewInfo
    end
    
end