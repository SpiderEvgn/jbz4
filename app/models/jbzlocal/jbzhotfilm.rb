class Jbzlocal::Jbzhotfilm < ActiveRecord::Base
  self.primary_key = "filmId"
  has_many :jbzforetells, foreign_key: "filmId"
end
