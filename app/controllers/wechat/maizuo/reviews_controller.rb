class Wechat::Maizuo::ReviewsController < ApplicationController

  def getReviewInfo
    @films = Wechat::Jbzlocal::Hotfilm.all
    @films.each do |film|
      if @reviews = Wechat::Maizuo::Review.getReviews(film.filmId)
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
      # if @reviews
      end
    # @films = Jbzhotfilm.all
    end
  # def getReviewInfo
  end
    
end