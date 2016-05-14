class AddColumnToZhizhuregions < ActiveRecord::Migration
  def change
    add_column :wechat_zhizhu_regions, :cityId, :string
    add_column :wechat_zhizhu_regions, :regionId, :string
    add_column :wechat_zhizhu_regions, :regionName, :string
  end
end
