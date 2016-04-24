class Jbzforetell < ActiveRecord::Base
	belongs_to :jbzhotfilm, foreign_key: "filmId"
	belongs_to :jbzcinema, foreign_key: "cinemaId"
end
