class AddColumnToJbzcinemas < ActiveRecord::Migration
  def change
    add_column :wechat_jbzlocal_cinemas, :cityId, :string
    add_column :wechat_jbzlocal_cinemas, :cityName, :string
    add_column :wechat_jbzlocal_cinemas, :cinemaId, :string
    add_column :wechat_jbzlocal_cinemas, :cinemaName, :string
    add_column :wechat_jbzlocal_cinemas, :logo, :string
    add_column :wechat_jbzlocal_cinemas, :address, :string
    add_column :wechat_jbzlocal_cinemas, :region, :string
    add_column :wechat_jbzlocal_cinemas, :phone, :string
    add_column :wechat_jbzlocal_cinemas, :hallId, :string
    add_column :wechat_jbzlocal_cinemas, :hallNames, :string
    add_column :wechat_jbzlocal_cinemas, :seatCounts, :string
    add_column :wechat_jbzlocal_cinemas, :vipflags, :string
    add_column :wechat_jbzlocal_cinemas, :ticketFlag, :string
    add_column :wechat_jbzlocal_cinemas, :seatFlag, :string
    add_column :wechat_jbzlocal_cinemas, :busPath, :string
    add_column :wechat_jbzlocal_cinemas, :subway, :string
    add_column :wechat_jbzlocal_cinemas, :businessCircle, :string
    add_column :wechat_jbzlocal_cinemas, :longitude, :string
    add_column :wechat_jbzlocal_cinemas, :latitude, :string
  end
end
