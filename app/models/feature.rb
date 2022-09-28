class Feature < ApplicationRecord
  has_many :composeds, dependent: :destroy
  validates :feature, presence: true, uniqueness: true
end
