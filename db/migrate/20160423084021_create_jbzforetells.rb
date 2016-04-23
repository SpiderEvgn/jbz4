class CreateJbzforetells < ActiveRecord::Migration
  def change
    create_table :jbzforetells do |t|

      t.timestamps null: false
    end
  end
end
