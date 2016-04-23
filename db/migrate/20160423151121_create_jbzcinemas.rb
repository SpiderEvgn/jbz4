class CreateJbzcinemas < ActiveRecord::Migration
  def change
    create_table :jbzcinemas do |t|

      t.timestamps null: false
    end
  end
end
