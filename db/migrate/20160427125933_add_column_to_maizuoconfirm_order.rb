class AddColumnToMaizuoconfirmOrder < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_confirmorders, :orderId, :string
    add_column :wechat_maizuo_confirmorders, :offerId, :string
    add_column :wechat_maizuo_confirmorders, :confirmId, :string
    add_column :wechat_maizuo_confirmorders, :offerOrderId, :string
    add_column :wechat_maizuo_confirmorders, :thirdConfirmId, :string
    add_column :wechat_maizuo_confirmorders, :takeTicketPostion, :string
    add_column :wechat_maizuo_confirmorders, :smTemplate, :text
    add_column :wechat_maizuo_confirmorders, :isCheckGround, :string
    add_column :wechat_maizuo_confirmorders, :seatType, :string
    add_column :wechat_maizuo_confirmorders, :mobile, :string
  end
end
