class CreateWechatZhizhuShows < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_shows do |t|

      t.timestamps null: false
    end
  end
end
