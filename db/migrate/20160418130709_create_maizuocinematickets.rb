class CreateMaizuocinematickets < ActiveRecord::Migration
  def change
    create_table :maizuo_cinematickets do |t|

      t.timestamps null: false
    end
  end
end
