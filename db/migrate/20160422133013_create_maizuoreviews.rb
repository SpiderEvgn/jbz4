class CreateMaizuoreviews < ActiveRecord::Migration
  def change
    create_table :maizuoreviews do |t|

      t.timestamps null: false
    end
  end
end
