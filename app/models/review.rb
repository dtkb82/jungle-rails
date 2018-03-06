class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates :description, presence: true, length: { minimum: 5 }
	validates :product, presence: true
	validates :user, presence: true
	validates :rating, presence: true

end
