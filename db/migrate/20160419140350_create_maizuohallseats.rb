class CreateMaizuohallseats < ActiveRecord::Migration
  def change
    create_table :wechat_maizuo_hallseats do |t|

      t.timestamps null: false
    end
  end
end
