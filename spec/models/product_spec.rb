require 'rails_helper'

RSpec.describe Product, type: :model do

  # describe 'Associations' do
  #   it 'belongs to category' do
  #     assc = described_class.reflect_on_association(:category)
  #     expect(assc.macro).to eq :belongs_to
  #   end
  # end

  describe 'Validations' do
    it 'is valid with all valid attributes' do
      @category = Category.create(name: 'Cat')
      @product = Product.create(
        name: 'red bookshelf',
        price: 347.99,
        quantity: 47,
        category: @category
      )
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it 'is not valid without a name' do
      @category = Category.create(name: 'Dog')
      @product = Product.new(
        name: nil,
        price: 34.99,
        quantity: 9,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.create(name: 'Geese')
      @product = Product.new(
        name: 'HonkerBoops',
        price: nil,
        quantity: 9000,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.create(name: 'Geese')
      @product = Product.new(
        name: 'HonkerBoops',
        price: 34.99,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      # @category = Category.create(name: 'Geese')
      @product = Product.new(
        name: 'HonkerBoops',
        price: 34.99,
        quantity: 9,
        category: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end

end
