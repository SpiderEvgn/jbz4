class AddColumnToJbzlocalorders < ActiveRecord::Migration
  def change
    add_column :wechat_jbzlocal_orders, :orderId, :string
    add_column :wechat_jbzlocal_orders, :offerId, :string
    add_column :wechat_jbzlocal_orders, :confirmId, :string
    add_column :wechat_jbzlocal_orders, :offerOrderId, :string
    add_column :wechat_jbzlocal_orders, :thirdConfirmId, :string
    add_column :wechat_jbzlocal_orders, :takeTicketPostion, :string
    add_column :wechat_jbzlocal_orders, :smTemplate, :text
    add_column :wechat_jbzlocal_orders, :isCheckGround, :string
    add_column :wechat_jbzlocal_orders, :seatType, :string
    add_column :wechat_jbzlocal_orders, :mobile, :string
    add_column :wechat_jbzlocal_orders, :card, :string
    add_column :wechat_jbzlocal_orders, :payMethod, :string
    add_column :wechat_jbzlocal_orders, :platformId, :string
  end
end
