class CreateWechatZhizhuFilms < ActiveRecord::Migration
  def change
    create_table :wechat_zhizhu_films do |t|

      t.timestamps null: false
    end
  end
end
