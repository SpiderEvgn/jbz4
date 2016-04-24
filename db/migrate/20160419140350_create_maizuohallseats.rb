class CreateMaizuohallseats < ActiveRecord::Migration
  def change
    create_table :maizuo_hallseats do |t|

      t.timestamps null: false
    end
  end
end
