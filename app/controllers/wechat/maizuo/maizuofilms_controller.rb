class Wechat::Maizuo::MaizuofilmsController < ApplicationController
  before_action :getFilmInfo
  # 还没想明白怎么很好的将数据导入本地数据库，暂且临时激活一个 action 将数据一次性导入，
  # 然后就注释掉不用了，之后 index 数据就直接从本地数据库读

  def index
    @films = Maizuofilm.all.paginate(:page => params[:page], :per_page => 5)
    # @films = Film.getFilms 一开始用来查看数据结构，输出完整的返回值
  end

  private 
    def getFilmInfo
      @films = Maizuofilm.getFilms
      @films.each do |film|
        f = Maizuofilm.new
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
      end
    end
end
