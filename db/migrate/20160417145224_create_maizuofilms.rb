class CreateMaizuofilms < ActiveRecord::Migration
  def change
    create_table :maizuo_films do |t|

      t.timestamps null: false
    end
  end
end
