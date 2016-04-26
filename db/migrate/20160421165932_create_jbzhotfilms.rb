class CreateJbzhotfilms < ActiveRecord::Migration
  def change
    create_table :wechat_jbzlocal_hotfilms do |t|

      t.timestamps null: false
    end
  end
end
