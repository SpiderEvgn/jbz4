class CreateJbzhotfilms < ActiveRecord::Migration
  def change
    create_table :jbzlocal_hotfilms do |t|

      t.timestamps null: false
    end
  end
end
