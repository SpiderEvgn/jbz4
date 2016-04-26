class AddColumnToMaizuohallseats < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_hallseats, :cinemaId, :string
    add_column :wechat_maizuo_hallseats, :hallId, :string
    add_column :wechat_maizuo_hallseats, :seatId, :string
    add_column :wechat_maizuo_hallseats, :sectionId, :string
    add_column :wechat_maizuo_hallseats, :rowId, :string
    add_column :wechat_maizuo_hallseats, :rowNum, :string
    add_column :wechat_maizuo_hallseats, :columnId, :string
    add_column :wechat_maizuo_hallseats, :columnNum, :string
    add_column :wechat_maizuo_hallseats, :damagedFlag, :string
    add_column :wechat_maizuo_hallseats, :loveIndex, :string
  end
end
