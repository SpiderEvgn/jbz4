class Wechat::Jbzlocal::Hotfilm < ActiveRecord::Base
  self.primary_key = "filmId"
  has_many :jbzlocal_foretells, class_name: 'Wechat::Jbzlocal::Foretell', foreign_key: :filmId
end
