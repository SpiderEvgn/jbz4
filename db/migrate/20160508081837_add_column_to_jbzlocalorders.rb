class AddColumnToJbzlocalorders < ActiveRecord::Migration
  def change
    add_column :wechat_jbzlocal_Orders, :orderId, :string
    add_column :wechat_jbzlocal_Orders, :offerId, :string
    add_column :wechat_jbzlocal_Orders, :confirmId, :string
    add_column :wechat_jbzlocal_Orders, :offerOrderId, :string
    add_column :wechat_jbzlocal_Orders, :thirdConfirmId, :string
    add_column :wechat_jbzlocal_Orders, :takeTicketPostion, :string
    add_column :wechat_jbzlocal_Orders, :smTemplate, :text
    add_column :wechat_jbzlocal_Orders, :isCheckGround, :string
    add_column :wechat_jbzlocal_Orders, :seatType, :string
    add_column :wechat_jbzlocal_Orders, :mobile, :string
    add_column :wechat_jbzlocal_Orders, :card, :string
    add_column :wechat_jbzlocal_Orders, :payMethod, :string
    add_column :wechat_jbzlocal_Orders, :platformId, :string
  end
end
