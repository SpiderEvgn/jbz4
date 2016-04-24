class AddColumnToMaizuofilms < ActiveRecord::Migration
  def change
    add_column :maizuo_films, :filmId, :string
    add_column :maizuo_films, :name, :string
    add_column :maizuo_films, :director, :string
    add_column :maizuo_films, :actors, :string
    add_column :maizuo_films, :filmType, :string
    add_column :maizuo_films, :area, :string
    add_column :maizuo_films, :length, :string
    add_column :maizuo_films, :releaseDate, :string
    add_column :maizuo_films, :isShow, :string
    add_column :maizuo_films, :language, :string
    add_column :maizuo_films, :company, :string
    add_column :maizuo_films, :info, :text
    add_column :maizuo_films, :picAddr, :string
    add_column :maizuo_films, :dimensional, :string
    add_column :maizuo_films, :shortInfo, :string
    add_column :maizuo_films, :videoUrl, :string
    add_column :maizuo_films, :grade, :string
  end
end
