class CreateWechatZhizhuHalls < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_halls do |t|

      t.timestamps null: false
    end
  end
end
