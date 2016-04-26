class Wechat::Jbzlocal::Cinema < ActiveRecord::Base
  self.primary_key = "cinemaId"
  has_many :wechat_jbzlocal_foretells, class_name: 'Wechat::Jbzlocal::Foretell', foreign_key: :cinemaId
end
