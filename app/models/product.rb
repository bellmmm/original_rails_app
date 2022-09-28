class Product < ApplicationRecord
  has_many :dislikes, dependent: :destroy
  has_many :composeds, dependent: :destroy
  has_many :elements, through: :composeds, source: :feature
  validates :name, presence: true, length:{maximum:255},
                          uniqueness: true
  default_scope -> { order(:id)}



  # 特徴(feature)をcomposedに設定する
  def set_composed(feature)
    elements << feature
  end

  # 特徴(feature)をcomposedから解除する
  def unset_composed(feature)
    composeds.find_by(feature_id: feature.id).destroy
  end

  # 該当の商品がcomposedに設定していたらtrueを返す
  def setting_composed?(feature)
    elements.include?(feature)
  end

end
