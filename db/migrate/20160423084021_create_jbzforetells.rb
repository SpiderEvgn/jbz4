class CreateJbzforetells < ActiveRecord::Migration
  def change
    create_table :wechat_jbzlocal_foretells do |t|

      t.timestamps null: false
    end
  end
end
