class Category < ActiveRecord::Base

  has_many :products

  validates :name, presence: {strict: true},
            uniqueness: true, on: :create

end
