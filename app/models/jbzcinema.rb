class Jbzcinema < ActiveRecord::Base
	self.primary_key = "cinemaId"
  has_many :jbzforetells, foreign_key: "cinemaId"
end
