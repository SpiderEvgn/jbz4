class CreateMaizuocinemas < ActiveRecord::Migration
  def change
    create_table :maizuo_cinemas do |t|

      t.timestamps null: false
    end
  end
end
