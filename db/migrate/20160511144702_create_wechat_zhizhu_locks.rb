class CreateWechatZhizhuLocks < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_locks do |t|

      t.timestamps null: false
    end
  end
end
