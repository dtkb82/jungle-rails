require 'rails_helper'

RSpec.describe Product, type: :model do

	describe "Validations" do

		it "Should save" do 
			@category = Category.new(name: "Apparel")
			@products = Product.new(
			name: "Hipster Hat",
			price: 10,
			quantity: 40,
			category: @category
			)

			expect(@products.name).to eq("Hipster Hat")
			expect(@products.price).to eq(10)
			expect(@products.quantity).to eq(40)
			expect(@products.category).to eq(@category)
			expect(@products).to be_valid
		end
	


		it "should have a name" do
			@category = Category.new(name: "Apparel")
			@products = Product.new(
				name: nil,
				price: 10,
				quantity: 40,
				category: @category
				)

			expect(@products).to_not be_valid
			expect(@products.errors[:name].size).to eq(1)
		end

		it "should have a price" do
			@category = Category.new(name: "Apparel")
			@products = Product.new(
				name: "Hipster Hat",
				price: nil,
				quantity: 40,
				category: @category
				)

			expect(@products).to_not be_valid
			expect(@products.errors[:price].size).to eq(2)
		end

		it "should have a quantity" do
			@category = Category.new(name: "Apparel")
			@products = Product.new(
				name: "Hipster Hat",
				price: 10,
				quantity: nil,
				category: @category
				)

			expect(@products).to_not be_valid
			expect(@products.errors[:quantity].size).to eq(1)
		end

		it "should have a category" do
			@category = Category.new(name: "Apparel")
			@products = Product.new(
				name: "Hipster Hat",
				price: 10,
				quantity: 40,
				category: nil
				)

			expect(@products).to_not be_valid
			expect(@products.errors[:category].size).to eq(1)
		end
	end
end
