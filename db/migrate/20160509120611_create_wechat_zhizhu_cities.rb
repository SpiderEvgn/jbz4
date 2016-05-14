class CreateWechatZhizhuCities < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_cities do |t|

      t.timestamps null: false
    end
  end
end
