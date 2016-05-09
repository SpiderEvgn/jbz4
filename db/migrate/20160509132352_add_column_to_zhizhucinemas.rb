class AddColumnToZhizhucinemas < ActiveRecord::Migration
  def change
    add_column :wechat_zhizhu_cinemas, :cityId, :string
    add_column :wechat_zhizhu_cinemas, :regionId, :string
    add_column :wechat_zhizhu_cinemas, :cinemaId, :string
    add_column :wechat_zhizhu_cinemas, :cinemaName, :string
    add_column :wechat_zhizhu_cinemas, :cinemaLogo, :string
    add_column :wechat_zhizhu_cinemas, :cinemaAdd, :string
    add_column :wechat_zhizhu_cinemas, :contact, :string
    add_column :wechat_zhizhu_cinemas, :getTicketWay, :string
    add_column :wechat_zhizhu_cinemas, :endbuyDate, :string
    add_column :wechat_zhizhu_cinemas, :presaleDay, :string
    add_column :wechat_zhizhu_cinemas, :longitude, :string
    add_column :wechat_zhizhu_cinemas, :latitude, :string
  end
end