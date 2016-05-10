class AddColumnToZhizhushow < ActiveRecord::Migration
  def change
    add_column :wechat_zhizhu_shows, :showId, :string
    add_column :wechat_zhizhu_shows, :cinemaId, :string
    add_column :wechat_zhizhu_shows, :cinemaName, :string
    add_column :wechat_zhizhu_shows, :hallId, :string
    add_column :wechat_zhizhu_shows, :hallName, :string
    add_column :wechat_zhizhu_shows, :filmId, :string
    add_column :wechat_zhizhu_shows, :filmName, :string
    add_column :wechat_zhizhu_shows, :showDate, :string
    add_column :wechat_zhizhu_shows, :showTime, :string
    add_column :wechat_zhizhu_shows, :staPrice, :string
    add_column :wechat_zhizhu_shows, :userPrice, :string
    add_column :wechat_zhizhu_shows, :merPrice, :string
    add_column :wechat_zhizhu_shows, :feePrice, :string
    add_column :wechat_zhizhu_shows, :language, :string
    add_column :wechat_zhizhu_shows, :duration, :string
    add_column :wechat_zhizhu_shows, :dimensional, :string
    add_column :wechat_zhizhu_shows, :activityId, :string
  end
end
