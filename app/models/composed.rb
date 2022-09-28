class Composed < ApplicationRecord
  belongs_to :product
  belongs_to :feature
  validates :product_id, presence: true
  validates :feature_id, presence: true

end
