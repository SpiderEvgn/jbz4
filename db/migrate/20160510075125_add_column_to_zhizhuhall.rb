class AddColumnToZhizhuhall < ActiveRecord::Migration
  def change
    add_column :wechat_zhizhu_halls, :cinemaId, :string
    add_column :wechat_zhizhu_halls, :hallId, :string
    add_column :wechat_zhizhu_halls, :hallName, :string
    add_column :wechat_zhizhu_halls, :hallType, :string
  end
end
