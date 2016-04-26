class AddColumntoMaizuocinematickets < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_cinematickets, :cinemaId, :string
    add_column :wechat_maizuo_cinematickets, :ticketId, :string
    add_column :wechat_maizuo_cinematickets, :ticketType, :string
    add_column :wechat_maizuo_cinematickets, :ticketName, :string
    add_column :wechat_maizuo_cinematickets, :markerPrice, :string
    add_column :wechat_maizuo_cinematickets, :price, :string
    add_column :wechat_maizuo_cinematickets, :desc, :string
    add_column :wechat_maizuo_cinematickets, :enableDay, :string
    add_column :wechat_maizuo_cinematickets, :invalidationDate, :string
    add_column :wechat_maizuo_cinematickets, :effectiveBeginTime, :string
  end
end
