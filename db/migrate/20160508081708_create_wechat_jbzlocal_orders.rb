class CreateWechatJbzlocalOrders < ActiveRecord::Migration
  def change
    create_table :wechat_jbzlocal_orders do |t|

      t.timestamps null: false
    end
  end
end
