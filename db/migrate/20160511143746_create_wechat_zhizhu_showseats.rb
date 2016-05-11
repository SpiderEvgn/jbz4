class CreateWechatZhizhuShowseats < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_showseats do |t|

      t.timestamps null: false
    end
  end
end
