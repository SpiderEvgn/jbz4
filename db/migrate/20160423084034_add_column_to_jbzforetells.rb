class AddColumnToJbzforetells < ActiveRecord::Migration
  def change
  	add_column :jbzforetells, :cinemaId, :string
    add_column :jbzforetells, :showDate, :string
    add_column :jbzforetells, :showTime, :string
    add_column :jbzforetells, :hallId, :string
    add_column :jbzforetells, :hallName, :string
    add_column :jbzforetells, :foretellId, :string
    add_column :jbzforetells, :filmId, :string
    add_column :jbzforetells, :price, :string
    add_column :jbzforetells, :marketPrice, :string
    add_column :jbzforetells, :flag, :string
    add_column :jbzforetells, :language, :string
    add_column :jbzforetells, :duration, :string
    add_column :jbzforetells, :timeout, :string
    add_column :jbzforetells, :sectionId, :string
    add_column :jbzforetells, :dimensional, :string
    add_column :jbzforetells, :offerId, :string
    add_column :jbzforetells, :lockNeedMobile, :string
  end
end
