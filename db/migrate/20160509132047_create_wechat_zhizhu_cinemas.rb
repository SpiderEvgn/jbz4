class CreateWechatZhizhuCinemas < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_cinemas do |t|

      t.timestamps null: false
    end
  end
end
