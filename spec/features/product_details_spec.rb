require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 88.03
      )
    end
  end

  scenario 'and they click on a product details link' do
    # ACT
    visit root_path
    save_screenshot
    first('article.product').find_by_id('product-heading').click

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css('.products-show')
  end


end
