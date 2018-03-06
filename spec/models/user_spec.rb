require 'rails_helper'

RSpec.describe User, type: :model do
  
	describe "Validations" do

		it "user should save" do
			@users = User.new(
				first_name: "Bobby",
				last_name: "Tables",
				email: "bobbytables@hotmail.com",
				password: "1234",
				password_confirmation: "1234"
				)

			expect(@users.first_name).to eq("Bobby")
			expect(@users.last_name).to eq("Tables")
			expect(@users.email).to eq("bobbytables@hotmail.com")
			expect(@users.password).to eq("1234")
			expect(@users.password_confirmation).to eq("1234")
			expect(@users).to be_valid
		end

		it "passwords should match" do
			@users = User.new(
				first_name: "Bobby",
				last_name: "Tables",
				email: "bobbytables@hotmail.com",
				password: "1234",
				password_confirmation: "1111"
				)

			expect(@users).to_not be_valid
			expect(@users.errors[:password_confirmation].size).to eq(2)
		end

		it "passwords should have at least 4 characters" do
			@users = User.new(
				first_name: "Bobby",
				last_name: "Tables",
				email: "bobbytables@hotmail.com",
				password: "12",
				password_confirmation: "12"
				)

			expect(@users).to_not be_valid
			expect(@users.errors[:password].size).to eq(1)
		end
	end

	describe '.authenticate_with_credentials' do

		it "user should save" do
			@users = User.new(
				first_name: "Bobby",
				last_name: "Tables",
				email: "bobbytables@hotmail.com",
				password: "1234",
				password_confirmation: "1234"
				)

			expect(@users.first_name).to eq("Bobby")
			expect(@users.last_name).to eq("Tables")
			expect(@users.email).to eq("bobbytables@hotmail.com")
			expect(@users.password).to eq("1234")
			expect(@users.password_confirmation).to eq("1234")
			expect(@users).to be_valid
		end

		it "should pass is spaces are present" do
			@users = User.new(
				first_name: "Bobby",
				last_name: "Tables",
				email: "   bobbytables@hotmail.com",
				password: "1234",
				password_confirmation: "1234"
				)

			expect(@users).to be_valid
		end

		it "should pass if type cases are different" do
			@users = User.new(
				first_name: "Bobby",
				last_name: "Tables",
				email: "BobbyTABles@hotmail.com",
				password: "1234",
				password_confirmation: "1234"
				)

			expect(@users).to be_valid
		end



	end

end
