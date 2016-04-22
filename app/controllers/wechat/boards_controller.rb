class Wechat::BoardsController < ApplicationController
  layout 'wechat'

  def jbz_hotfilm
    @films = Jbzhotfilm.all
  end

end
