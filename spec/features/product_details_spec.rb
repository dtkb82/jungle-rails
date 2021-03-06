require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

	#SETUP
	before :each do
		@category = Category.create! name: 'Apparel'

		10.times do |n|
			@category.products.create!(
				name: Faker::Hipster.sentence(3),
				description: Faker::Hipster.paragraph(4),
				image: open_asset('apparel1.jpg'),
				quantity: 10,
				price: 64.99
				)
			end
		end


  scenario "User can navigate to product detail page" do
  #   # ACT
    visit root_path
    page.find('article.product', match: :first).find_link('Details').click

  #   # DEBUG / VERIFY
    # save_screenshot
    expect(page).to have_css 'section.products-show', count: 1
  end

end

