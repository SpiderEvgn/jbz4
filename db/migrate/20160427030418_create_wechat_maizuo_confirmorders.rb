class CreateWechatMaizuoConfirmorders < ActiveRecord::Migration
  def change
    create_table :wechat_maizuo_confirmorders do |t|

      t.timestamps null: false
    end
  end
end
