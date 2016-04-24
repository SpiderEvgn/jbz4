class CreateMaizuoforetells < ActiveRecord::Migration
  def change
    create_table :maizuo_foretells do |t|

      t.timestamps null: false
    end
  end
end
