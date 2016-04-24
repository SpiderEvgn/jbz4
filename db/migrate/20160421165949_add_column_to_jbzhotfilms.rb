class AddColumnToJbzhotfilms < ActiveRecord::Migration
  def change
    add_column :jbzlocal_hotfilms, :filmId, :string
    add_column :jbzlocal_hotfilms, :name, :string
    add_column :jbzlocal_hotfilms, :director, :string
    add_column :jbzlocal_hotfilms, :actors, :string
    add_column :jbzlocal_hotfilms, :filmType, :string
    add_column :jbzlocal_hotfilms, :area, :string
    add_column :jbzlocal_hotfilms, :length, :string
    add_column :jbzlocal_hotfilms, :releaseDate, :string
    add_column :jbzlocal_hotfilms, :isShow, :string
    add_column :jbzlocal_hotfilms, :language, :string
    add_column :jbzlocal_hotfilms, :company, :string
    add_column :jbzlocal_hotfilms, :info, :text
    add_column :jbzlocal_hotfilms, :picAddr, :string
    add_column :jbzlocal_hotfilms, :dimensional, :string
    add_column :jbzlocal_hotfilms, :shortInfo, :string
    add_column :jbzlocal_hotfilms, :videoUrl, :string
    add_column :jbzlocal_hotfilms, :grade, :string
  end
end
