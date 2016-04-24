class AddColumnToJbzforetells < ActiveRecord::Migration
  def change
  	add_column :jbzlocal_foretells, :cinemaId, :string
    add_column :jbzlocal_foretells, :showDate, :string
    add_column :jbzlocal_foretells, :showTime, :string
    add_column :jbzlocal_foretells, :hallId, :string
    add_column :jbzlocal_foretells, :hallName, :string
    add_column :jbzlocal_foretells, :foretellId, :string
    add_column :jbzlocal_foretells, :filmId, :string
    add_column :jbzlocal_foretells, :price, :string
    add_column :jbzlocal_foretells, :marketPrice, :string
    add_column :jbzlocal_foretells, :flag, :string
    add_column :jbzlocal_foretells, :language, :string
    add_column :jbzlocal_foretells, :duration, :string
    add_column :jbzlocal_foretells, :timeout, :string
    add_column :jbzlocal_foretells, :sectionId, :string
    add_column :jbzlocal_foretells, :dimensional, :string
    add_column :jbzlocal_foretells, :offerId, :string
    add_column :jbzlocal_foretells, :lockNeedMobile, :string
  end
end
