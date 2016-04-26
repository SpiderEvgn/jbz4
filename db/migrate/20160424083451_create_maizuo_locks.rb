class CreateMaizuoLocks < ActiveRecord::Migration
  def change
    create_table :wechat_maizuo_locks do |t|

      t.timestamps null: false
    end
  end
end
