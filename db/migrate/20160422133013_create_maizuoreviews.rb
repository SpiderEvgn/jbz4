class CreateMaizuoreviews < ActiveRecord::Migration
  def change
    create_table :maizuo_reviews do |t|

      t.timestamps null: false
    end
  end
end
