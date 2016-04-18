class CreateMaizuocinematickets < ActiveRecord::Migration
  def change
    create_table :maizuocinematickets do |t|

      t.timestamps null: false
    end
  end
end
