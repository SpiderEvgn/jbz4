class Wechat::Maizuo::FilmsController < ApplicationController

  def getFilmInfo
    if @films = Wechat::Maizuo::Film.getFilms
      # 如果返回为nil，即本次查询失败，进入下一个循环
      @films.each do |film|
        f = Wechat::Maizuo::Film.new

        f.filmId = film['id']
        f.name = film['name']
        f.director = film['director']
        f.actors = film['actors']
        f.filmType = film['type']
        f.area = film['area']
        f.length = film['length']
        f.releaseDate = film['releaseDate']
        f.isShow = film['isShow']
        f.language = film['language']
        f.company = film['company']
        f.info = film['info']
        f.picAddr = film['picAddr']
        f.dimensional = film['dimensional']
        f.shortInfo = film['shortInfo']
        f.videoUrl = film['videoUrl']
        f.grade = film['grade']

        f.save
      # @films.each do |film|
      end
    # if @films
    end
  # def getFilmInfo
  end
    
end
