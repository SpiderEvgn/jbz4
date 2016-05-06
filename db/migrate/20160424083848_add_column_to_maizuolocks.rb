class AddColumnToMaizuolocks < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_locks, :orderId, :string
    add_column :wechat_maizuo_locks, :foretellId, :string
    add_column :wechat_maizuo_locks, :seatId, :string
    add_column :wechat_maizuo_locks, :count, :string
    add_column :wechat_maizuo_locks, :price, :string
    add_column :wechat_maizuo_locks, :totalprice, :string
    add_column :wechat_maizuo_locks, :mobile, :string
    add_column :wechat_maizuo_locks, :isOrder, :string
  end
end
