class Wechat::Jbzlocal::Hotfilm < ActiveRecord::Base
  self.primary_key = "filmId"
  has_many :wechat_jbzlocal_foretells, class_name: 'Wechat::Jbzlocal::Foretell', foreign_key: :filmId
end
