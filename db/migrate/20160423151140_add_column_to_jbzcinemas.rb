class AddColumnToJbzcinemas < ActiveRecord::Migration
  def change
    add_column :jbzcinemas, :cityId, :string
    add_column :jbzcinemas, :cityName, :string
    add_column :jbzcinemas, :cinemaId, :string
    add_column :jbzcinemas, :cinemaName, :string
    add_column :jbzcinemas, :logo, :string
    add_column :jbzcinemas, :address, :string
    add_column :jbzcinemas, :region, :string
    add_column :jbzcinemas, :phone, :string
    add_column :jbzcinemas, :hallId, :string
    add_column :jbzcinemas, :hallNames, :string
    add_column :jbzcinemas, :seatCounts, :string
    add_column :jbzcinemas, :vipflags, :string
    add_column :jbzcinemas, :ticketFlag, :string
    add_column :jbzcinemas, :seatFlag, :string
    add_column :jbzcinemas, :busPath, :string
    add_column :jbzcinemas, :subway, :string
    add_column :jbzcinemas, :businessCircle, :string
    add_column :jbzcinemas, :longitude, :string
    add_column :jbzcinemas, :latitude, :string
  end
end
