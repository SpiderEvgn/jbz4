class CreateMaizuohallseats < ActiveRecord::Migration
  def change
    create_table :maizuohallseats do |t|

      t.timestamps null: false
    end
  end
end
