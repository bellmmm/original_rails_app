class Product < ApplicationRecord
  has_many :dislikes, dependent: :destroy
  validates :name, presence: true, length:{maximum:255},
                          uniqueness: true
  default_scope -> { order(:id)}
end
