class CreateMaizuofilms < ActiveRecord::Migration
  def change
    create_table :maizuofilms do |t|

      t.timestamps null: false
    end
  end
end
