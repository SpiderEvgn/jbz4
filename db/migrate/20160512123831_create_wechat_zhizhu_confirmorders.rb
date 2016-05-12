class CreateWechatZhizhuConfirmorders < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_confirmorders do |t|

      t.timestamps null: false
    end
  end
end
