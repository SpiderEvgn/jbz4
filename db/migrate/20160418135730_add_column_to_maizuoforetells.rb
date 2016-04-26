class AddColumnToMaizuoforetells < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_foretells, :cinemaId, :string
    add_column :wechat_maizuo_foretells, :showDate, :string
    add_column :wechat_maizuo_foretells, :showTime, :string
    add_column :wechat_maizuo_foretells, :hallId, :string
    add_column :wechat_maizuo_foretells, :hallName, :string
    add_column :wechat_maizuo_foretells, :foretellId, :string
    add_column :wechat_maizuo_foretells, :filmId, :string
    add_column :wechat_maizuo_foretells, :price, :string
    add_column :wechat_maizuo_foretells, :marketPrice, :string
    add_column :wechat_maizuo_foretells, :flag, :string
    add_column :wechat_maizuo_foretells, :language, :string
    add_column :wechat_maizuo_foretells, :duration, :string
    add_column :wechat_maizuo_foretells, :timeout, :string
    add_column :wechat_maizuo_foretells, :sectionId, :string
    add_column :wechat_maizuo_foretells, :dimensional, :string
    add_column :wechat_maizuo_foretells, :offerId, :string
    add_column :wechat_maizuo_foretells, :lockNeedMobile, :string
  end
end
