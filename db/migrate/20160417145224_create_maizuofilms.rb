class CreateMaizuofilms < ActiveRecord::Migration
  def change
    create_table :wechat_maizuo_films do |t|

      t.timestamps null: false
    end
  end
end
