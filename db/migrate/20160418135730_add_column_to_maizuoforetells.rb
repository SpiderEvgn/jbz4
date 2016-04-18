class AddColumnToMaizuoforetells < ActiveRecord::Migration
  def change
    add_column :maizuoforetells, :cinemaId, :string
    add_column :maizuoforetells, :showDate, :string
    add_column :maizuoforetells, :showTime, :string
    add_column :maizuoforetells, :hallId, :string
    add_column :maizuoforetells, :hallName, :string
    add_column :maizuoforetells, :foretellId, :string
    add_column :maizuoforetells, :filmId, :string
    add_column :maizuoforetells, :price, :string
    add_column :maizuoforetells, :marketPrice, :string
    add_column :maizuoforetells, :flag, :string
    add_column :maizuoforetells, :language, :string
    add_column :maizuoforetells, :duration, :string
    add_column :maizuoforetells, :timeout, :string
    add_column :maizuoforetells, :sectionId, :string
    add_column :maizuoforetells, :dimensional, :string
    add_column :maizuoforetells, :offerId, :string
    add_column :maizuoforetells, :lockNeedMobile, :string
  end
end
