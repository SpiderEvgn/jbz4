class AddColumnToMaizuoreviews < ActiveRecord::Migration
  def change
    add_column :maizuoreviews, :filmId, :string
    add_column :maizuoreviews, :reviewId, :string
    add_column :maizuoreviews, :author, :string
    add_column :maizuoreviews, :authorHeadPic, :string
    add_column :maizuoreviews, :filmPic, :string
    add_column :maizuoreviews, :reviewTime, :string
    add_column :maizuoreviews, :reviewContent, :string
  end
end
