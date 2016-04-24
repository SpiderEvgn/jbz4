class AddIndexToJbzcinemas < ActiveRecord::Migration
  def change
    add_index :jbzlocal_cinemas, :cinemaId
  end
end
