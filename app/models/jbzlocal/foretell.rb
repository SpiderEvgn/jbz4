class Jbzlocal::Foretell < ActiveRecord::Base
  belongs_to :hotfilm, foreign_key: "filmId"
  belongs_to :cinema, foreign_key: "cinemaId"
end
