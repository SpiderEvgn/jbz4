class AddColumnToMaizuocinemas < ActiveRecord::Migration
  def change
    add_column :maizuo_cinemas, :cityId, :string
    add_column :maizuo_cinemas, :cityName, :string
    add_column :maizuo_cinemas, :cinemaId, :string
    add_column :maizuo_cinemas, :cinemaName, :string
    add_column :maizuo_cinemas, :logo, :string
    add_column :maizuo_cinemas, :address, :string
    add_column :maizuo_cinemas, :region, :string
    add_column :maizuo_cinemas, :phone, :string
    add_column :maizuo_cinemas, :hallId, :string
    add_column :maizuo_cinemas, :hallNames, :string
    add_column :maizuo_cinemas, :seatCounts, :string
    add_column :maizuo_cinemas, :vipflags, :string
    add_column :maizuo_cinemas, :ticketFlag, :string
    add_column :maizuo_cinemas, :seatFlag, :string
    add_column :maizuo_cinemas, :busPath, :string
    add_column :maizuo_cinemas, :subway, :string
    add_column :maizuo_cinemas, :businessCircle, :string
    add_column :maizuo_cinemas, :longitude, :string
    add_column :maizuo_cinemas, :latitude, :string
  end
end