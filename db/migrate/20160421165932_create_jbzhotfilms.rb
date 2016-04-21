class CreateJbzhotfilms < ActiveRecord::Migration
  def change
    create_table :jbzhotfilms do |t|

      t.timestamps null: false
    end
  end
end
