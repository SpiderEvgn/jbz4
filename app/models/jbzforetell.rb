class Jbzforetell < ActiveRecord::Base
	belongs_to :jbzhotfilm, foreign_key: "filmId"
end
