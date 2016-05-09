class CreateWechatZhizhuRegions < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_regions do |t|

      t.timestamps null: false
    end
  end
end
