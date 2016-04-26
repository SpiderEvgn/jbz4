class AddColumnToJbzhotfilms < ActiveRecord::Migration
  def change
    add_column :wechat_jbzlocal_hotfilms, :filmId, :string
    add_column :wechat_jbzlocal_hotfilms, :name, :string
    add_column :wechat_jbzlocal_hotfilms, :director, :string
    add_column :wechat_jbzlocal_hotfilms, :actors, :string
    add_column :wechat_jbzlocal_hotfilms, :filmType, :string
    add_column :wechat_jbzlocal_hotfilms, :area, :string
    add_column :wechat_jbzlocal_hotfilms, :length, :string
    add_column :wechat_jbzlocal_hotfilms, :releaseDate, :string
    add_column :wechat_jbzlocal_hotfilms, :isShow, :string
    add_column :wechat_jbzlocal_hotfilms, :language, :string
    add_column :wechat_jbzlocal_hotfilms, :company, :string
    add_column :wechat_jbzlocal_hotfilms, :info, :text
    add_column :wechat_jbzlocal_hotfilms, :picAddr, :string
    add_column :wechat_jbzlocal_hotfilms, :dimensional, :string
    add_column :wechat_jbzlocal_hotfilms, :shortInfo, :string
    add_column :wechat_jbzlocal_hotfilms, :videoUrl, :string
    add_column :wechat_jbzlocal_hotfilms, :grade, :string
  end
end
