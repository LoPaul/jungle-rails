require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  # before :all do
  #   User.crea
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"
  # scenarios
  #   visit('/login')

  #   within(''form') do
  #     fill_in 'email', with: 'adfaf'
  scenario "They see all products" do
    # ACT
    visit root_path


    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'article.product', count: 10
  end
end
