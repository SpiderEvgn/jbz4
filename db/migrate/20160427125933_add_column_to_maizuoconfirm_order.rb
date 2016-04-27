class AddColumnToMaizuoconfirmOrder < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_confirmorders, :orderId, :string
    add_column :wechat_maizuo_confirmorders, :offerId, :string
    add_column :wechat_maizuo_confirmorders, :confirmId, :string
    add_column :wechat_maizuo_confirmorders, :offerOrderId, :string
    add_column :wechat_maizuo_confirmorders, :thirdConfirmId, :string
    add_column :wechat_maizuo_confirmorders, :takeTicketPostion, :string
    add_column :wechat_maizuo_confirmorders, :smsTemplate, :string
    add_column :wechat_maizuo_confirmorders, :effectDate, :string
    add_column :wechat_maizuo_confirmorders, :invalidationDate, :string
    add_column :wechat_maizuo_confirmorders, :isCheckGround, :string
    add_column :wechat_maizuo_confirmorders, :seatType, :string
  end
end
