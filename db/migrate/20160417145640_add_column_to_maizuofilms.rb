class AddColumnToMaizuofilms < ActiveRecord::Migration
  def change
    add_column :maizuofilms, :filmId, :string
    add_column :maizuofilms, :name, :string
    add_column :maizuofilms, :director, :string
    add_column :maizuofilms, :actors, :string
    add_column :maizuofilms, :filmType, :string
    add_column :maizuofilms, :area, :string
    add_column :maizuofilms, :length, :string
    add_column :maizuofilms, :releaseDate, :string
    add_column :maizuofilms, :isShow, :string
    add_column :maizuofilms, :language, :string
    add_column :maizuofilms, :company, :string
    add_column :maizuofilms, :info, :text
    add_column :maizuofilms, :picAddr, :string
    add_column :maizuofilms, :dimensional, :string
    add_column :maizuofilms, :shortInfo, :string
    add_column :maizuofilms, :videoUrl, :string
    add_column :maizuofilms, :grade, :string
  end
end
