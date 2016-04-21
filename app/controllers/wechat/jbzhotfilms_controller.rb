class Wechat::JbzhotfilmsController < ApplicationController
layout 'wechat'
  
  def index
    @films = Jbzhotfilm.all
  end
  
end