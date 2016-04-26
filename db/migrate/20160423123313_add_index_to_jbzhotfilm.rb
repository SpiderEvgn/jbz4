class AddIndexToJbzhotfilm < ActiveRecord::Migration
  def change
    add_index :wechat_jbzlocal_hotfilms, :filmId
  end
end
