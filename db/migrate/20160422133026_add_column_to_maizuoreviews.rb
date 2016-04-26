class AddColumnToMaizuoreviews < ActiveRecord::Migration
  def change
    add_column :wechat_maizuo_reviews, :filmId, :string
    add_column :wechat_maizuo_reviews, :reviewId, :string
    add_column :wechat_maizuo_reviews, :author, :string
    add_column :wechat_maizuo_reviews, :authorHeadPic, :string
    add_column :wechat_maizuo_reviews, :filmPic, :string
    add_column :wechat_maizuo_reviews, :reviewTime, :string
    add_column :wechat_maizuo_reviews, :reviewContent, :string
  end
end
