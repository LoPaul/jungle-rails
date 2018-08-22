require 'rails_helper'

RSpec.feature "Add to carts", type: :feature, js: true do
  # SETUP
  email = "plo@gamil.com"
  pwd = "ploplo"
  before :each do
    @user = User.create!({
      first_name: "Paul",
      last_name: "Lo",
      email: email,
      password: pwd,
      password_confirmation: pwd
      # pwd: ploplo
      # password_digest: "$2a$10$gPNfx8hgvXGQHkcPLp6G4u0fkP0WeWIP72kWpYTewBC.L0Eh2Zofi"
    })
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

  scenario "Add to cart" do
    #login
    visit '/login'
    within 'form' do
      fill_in id: 'email', with: email
      fill_in id: 'password', with: pwd
  
      click_button 'Submit'
      sleep 5
      save_screenshot
    end

    # ACT
    visit root_path

    first('.product').find_link('Add').click

    expect(page).to have_text 'My Cart (1)'
    
    save_screenshot
  end
end



