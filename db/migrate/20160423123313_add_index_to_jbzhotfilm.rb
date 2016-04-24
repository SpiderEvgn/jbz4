class AddIndexToJbzhotfilm < ActiveRecord::Migration
  def change
  	add_index :jbzlocal_hotfilms, :filmId
  end
end
