class CreateMaizuoforetells < ActiveRecord::Migration
  def change
    create_table :maizuoforetells do |t|

      t.timestamps null: false
    end
  end
end
