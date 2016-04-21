class Wechat::JbzfilmsController < ApplicationController
layout 'wechat'
  
  def index
    @films = Maizuofilm.all.paginate(:page => params[:page], :per_page => 20)
  end
  
end