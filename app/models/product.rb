class Product < ApplicationRecord
  validates :product_name, presence: true, length:{maximum:255},
                          uniqueness: true
end
