class ReviewsController < ApplicationController
	before_action :find_product
	before_action :find_review, only: [:destroy]
	before_action :authenticate_user!, only: [:new]

	def index
		@review = Review.all.order("created_at DESC")
		
	end

	def new
		@review = Review.new
  	end

	def create
		@review = Review.new(review_params)
		@review.product_id = @product.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to product_path(@product)
		else
			render @product
		end
	end

	def destroy
		@review.destroy
		redirect_to product_path(@product)
	end
	

	private
		def review_params
			params.require(:review).permit(:rating, :description)
		end

		def find_product
			@product = Product.find(params[:product_id])	
		end

		def find_review
			@review = Review.find(params[:id])	
		end
end
