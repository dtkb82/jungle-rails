class ReviewsController < ApplicationController
	def index
		@product = Product.find(params[:product_id])
    	@reviews = @product.reviews
  	end

  	def show
		@product = Product.find(params[:product_id])
		@review = @product.reviews.find(params[:id])
		@review.user = current_user 
	end

	def new
		@product = Product.find(params[:product_id])
    	@review = post.review.build
  	end

	def create
		@product = Product.find(params[:product_id])
		@review = @product.reviews.create(review_params)
		@review.user = current_user
		@review.save
		# redirect_to product_path(@product)
		if @review.save
      		redirect_to review_path(@review)
    	else
      		redirect_to products_path @product
    	end
	end

	def destroy
		@review = current_user.reviews.find(params[:id])
		@review.destroy
		redirect_to product_path(@product)
	end
	

	private
		def review_params
			params.require(:review).permit(:user, :description)
		end
end
