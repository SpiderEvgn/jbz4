class Jbzlocal::Cinema < ActiveRecord::Base
  self.primary_key = "cinemaId"
  has_many :jbzlocal_foretells, foreign_key: "cinemaId"
end
