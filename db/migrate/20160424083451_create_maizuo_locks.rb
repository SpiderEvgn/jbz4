class CreateMaizuoLocks < ActiveRecord::Migration
  def change
    create_table :maizuo_locks do |t|

      t.timestamps null: false
    end
  end
end
