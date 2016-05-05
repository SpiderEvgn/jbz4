class Wechat::Jbzlocal::OrdersController < ApplicationController
  layout 'wechat'

  def show
    @seats = params[:id]
  end

end