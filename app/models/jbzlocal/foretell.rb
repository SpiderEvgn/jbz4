class Jbzlocal::Foretell < ActiveRecord::Base
  belongs_to :jbzlocal_hotfilm, foreign_key: "filmId"
  belongs_to :jbzlocal_cinema, foreign_key: "cinemaId"
end
