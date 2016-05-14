class CreateWechatMaizuoQueryorders < ActiveRecord::Migration
  def change
    create_table :wechat_maizuo_queryorders do |t|

      t.timestamps null: false
    end
  end
end
