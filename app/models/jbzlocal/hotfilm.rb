class Jbzlocal::Hotfilm < ActiveRecord::Base
  self.primary_key = "filmId"
  has_many :foretells, foreign_key: "filmId"
end
