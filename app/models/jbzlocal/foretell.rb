class Jbzlocal::Foretell < ActiveRecord::Base
  belongs_to :jbzlocal_hotfilm, class_name: 'Jbzlocal::Hotfilm', foreign_key: :filmId
  belongs_to :jbzlocal_cinema, class_name: 'Jbzlocal::Hotfilm', foreign_key: :cinemaId
end
