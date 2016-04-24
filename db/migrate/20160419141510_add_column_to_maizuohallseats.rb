class AddColumnToMaizuohallseats < ActiveRecord::Migration
  def change
    add_column :maizuo_hallseats, :cinemaId, :string
    add_column :maizuo_hallseats, :hallId, :string
    add_column :maizuo_hallseats, :seatId, :string
    add_column :maizuo_hallseats, :sectionId, :string
    add_column :maizuo_hallseats, :rowId, :string
    add_column :maizuo_hallseats, :rowNum, :string
    add_column :maizuo_hallseats, :columnId, :string
    add_column :maizuo_hallseats, :columnNum, :string
    add_column :maizuo_hallseats, :damagedFlag, :string
    add_column :maizuo_hallseats, :loveIndex, :string
  end
end
