class Game < ActiveRecord::Base


	validates :name, presence: true
	#validates :year_released, length: is: 4
	#validates :image, format: /\A\w+\.png\z/

	belongs_to :user
 	has_many :scores
 	has_many :scorers, through: :scores, source: :user
 

	def self.search_for(query)
		where('name LIKE :query or year_released LIKE :query', query: "%#{query}%")
	
	end


end
