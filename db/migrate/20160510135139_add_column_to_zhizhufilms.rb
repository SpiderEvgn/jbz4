class AddColumnToZhizhufilms < ActiveRecord::Migration
  def change
    add_column :wechat_zhizhu_films, :filmId, :string
    add_column :wechat_zhizhu_films, :filmName, :string
    add_column :wechat_zhizhu_films, :englishName, :string
    add_column :wechat_zhizhu_films, :language, :string
    add_column :wechat_zhizhu_films, :duration, :string
    add_column :wechat_zhizhu_films, :dimensional, :string
    add_column :wechat_zhizhu_films, :country, :string
    add_column :wechat_zhizhu_films, :director, :string
    add_column :wechat_zhizhu_films, :actor, :string
    add_column :wechat_zhizhu_films, :openingDate, :string
    add_column :wechat_zhizhu_films, :catalog, :string
    add_column :wechat_zhizhu_films, :picture, :string
    add_column :wechat_zhizhu_films, :description, :text
  end
end
