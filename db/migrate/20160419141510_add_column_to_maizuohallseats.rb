class AddColumnToMaizuohallseats < ActiveRecord::Migration
  def change
    add_column :maizuohallseats, :cinemaId, :string
    add_column :maizuohallseats, :hallId, :string
    add_column :maizuohallseats, :seatId, :string
    add_column :maizuohallseats, :sectionId, :string
    add_column :maizuohallseats, :rowId, :string
    add_column :maizuohallseats, :rowNum, :string
    add_column :maizuohallseats, :columnId, :string
    add_column :maizuohallseats, :columnNum, :string
    add_column :maizuohallseats, :damagedFlag, :string
    add_column :maizuohallseats, :loveIndex, :string
  end
end
