class Review < ActiveRecord::Base
	validates :description, presence: true, length: { minimum: 5 }
	validates :product, presence: true
	validates :user, presence: true
	validates :rating, presence: true

	belongs_to :user
	belongs_to :product
end
