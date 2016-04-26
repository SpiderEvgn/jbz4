class AddIndexToJbzcinemas < ActiveRecord::Migration
  def change
    add_index :wechat_jbzlocal_cinemas, :cinemaId
  end
end
