class CreateWechatMaizuoRealtimeseats < ActiveRecord::Migration
  def change
    create_table :wechat_maizuo_realtimeseats do |t|

      t.timestamps null: false
    end
  end
end
