class AddColumnToZhizhucitys < ActiveRecord::Migration
  def change
    add_column :wechat_zhizhu_cities, :cityId, :string
    add_column :wechat_zhizhu_cities, :cityName, :string
    add_column :wechat_zhizhu_cities, :cityType, :string
  end
end
