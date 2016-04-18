class AddColumntoMaizuocinematickets < ActiveRecord::Migration
  def change
    add_column :maizuocinematickets, :cinemaId, :string
    add_column :maizuocinematickets, :ticketId, :string
    add_column :maizuocinematickets, :ticketType, :string
    add_column :maizuocinematickets, :ticketName, :string
    add_column :maizuocinematickets, :markerPrice, :string
    add_column :maizuocinematickets, :price, :string
    add_column :maizuocinematickets, :desc, :string
    add_column :maizuocinematickets, :enableDay, :string
    add_column :maizuocinematickets, :invalidationDate, :string
    add_column :maizuocinematickets, :effectiveBeginTime, :string
  end
end
