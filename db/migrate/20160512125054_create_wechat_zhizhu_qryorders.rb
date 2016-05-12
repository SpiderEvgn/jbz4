class CreateWechatZhizhuQryorders < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_qryorders do |t|

      t.timestamps null: false
    end
  end
end
