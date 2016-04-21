class AddColumnToJbzhotfilms < ActiveRecord::Migration
  def change
    add_column :jbzhotfilms, :filmId, :string
    add_column :jbzhotfilms, :name, :string
    add_column :jbzhotfilms, :director, :string
    add_column :jbzhotfilms, :actors, :string
    add_column :jbzhotfilms, :filmType, :string
    add_column :jbzhotfilms, :area, :string
    add_column :jbzhotfilms, :length, :string
    add_column :jbzhotfilms, :releaseDate, :string
    add_column :jbzhotfilms, :isShow, :string
    add_column :jbzhotfilms, :language, :string
    add_column :jbzhotfilms, :company, :string
    add_column :jbzhotfilms, :info, :text
    add_column :jbzhotfilms, :picAddr, :string
    add_column :jbzhotfilms, :dimensional, :string
    add_column :jbzhotfilms, :shortInfo, :string
    add_column :jbzhotfilms, :videoUrl, :string
    add_column :jbzhotfilms, :grade, :string
  end
end
