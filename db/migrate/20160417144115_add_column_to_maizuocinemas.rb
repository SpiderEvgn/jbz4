class AddColumnToMaizuocinemas < ActiveRecord::Migration
  def change
    add_column :maizuocinemas, :cityId, :string
    add_column :maizuocinemas, :cityName, :string
    add_column :maizuocinemas, :cinemaId, :string
    add_column :maizuocinemas, :cinemaName, :string
    add_column :maizuocinemas, :logo, :string
    add_column :maizuocinemas, :address, :string
    add_column :maizuocinemas, :region, :string
    add_column :maizuocinemas, :phone, :string
    add_column :maizuocinemas, :hallId, :string
    add_column :maizuocinemas, :hallNames, :string
    add_column :maizuocinemas, :seatCounts, :string
    add_column :maizuocinemas, :vipflags, :string
    add_column :maizuocinemas, :ticketFlag, :string
    add_column :maizuocinemas, :seatFlag, :string
    add_column :maizuocinemas, :busPath, :string
    add_column :maizuocinemas, :subway, :string
    add_column :maizuocinemas, :businessCircle, :string
    add_column :maizuocinemas, :longitude, :string
    add_column :maizuocinemas, :latitude, :string
  end
end