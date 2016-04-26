class Wechat::Jbzlocal::Foretell < ActiveRecord::Base
  belongs_to :wechat_jbzlocal_hotfilm, class_name: 'Wechat::Jbzlocal::Hotfilm', foreign_key: :filmId
  belongs_to :wechat_jbzlocal_cinema, class_name: 'Wechat::Jbzlocal::Cinema', foreign_key: :cinemaId
end
