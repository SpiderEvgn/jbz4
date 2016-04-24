class Jbzlocal::Hotfilm < ActiveRecord::Base
  self.primary_key = "filmId"
  has_many :jbzlocal_foretells, foreign_key: "filmId"
end
