class CreateMaizuocinemas < ActiveRecord::Migration
  def change
    create_table :maizuocinemas do |t|

      t.timestamps null: false
    end
  end
end
