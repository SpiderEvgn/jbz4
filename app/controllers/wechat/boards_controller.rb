class Wechat::BoardsController < ApplicationController
  layout 'wechat'

  def jbz_hotfilm
    @films = Jbzhotfilm.all
  end

  def jbz_filtercinema
  	# 影院筛选页面，还没想好怎么设计
  	
  end

  def jbz_cinema
  	@cinemas = Maizuocinema.all
  	# 还没建立 Jbzcinema, 暂用 Maizuocinema
  end

end
