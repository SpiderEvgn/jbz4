class CreateJbzcinemas < ActiveRecord::Migration
  def change
    create_table :wechat_jbzlocal_cinemas do |t|

      t.timestamps null: false
    end
  end
end
