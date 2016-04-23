class AddIndexToJbzhotfilm < ActiveRecord::Migration
  def change
  	add_index :jbzhotfilms, :filmId
  end
end
