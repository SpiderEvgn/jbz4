class AddIndexToJbzcinemas < ActiveRecord::Migration
  def change
  	add_index :jbzcinemas, :cinemaId
  end
end
