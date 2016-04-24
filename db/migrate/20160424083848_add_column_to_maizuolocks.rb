class AddColumnToMaizuolocks < ActiveRecord::Migration
  def change
    add_column :maizuo_locks, :orderId, :string
    add_column :maizuo_locks, :foretellId, :string
    add_column :maizuo_locks, :seatId, :string
    add_column :maizuo_locks, :count, :string
    add_column :maizuo_locks, :price, :string
    add_column :maizuo_locks, :timestamp, :string
    add_column :maizuo_locks, :mobile, :string
    add_column :maizuo_locks, :result, :string
  end
end
