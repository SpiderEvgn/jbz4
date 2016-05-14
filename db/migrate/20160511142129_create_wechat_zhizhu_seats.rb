class CreateWechatZhizhuSeats < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_seats do |t|

      t.timestamps null: false
    end
  end
end
