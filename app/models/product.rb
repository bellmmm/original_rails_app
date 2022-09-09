class Product < ApplicationRecord
  validates :product_URL, presence: true, length:{maximum:255},
                          uniqueness: true
  #最大長は仮に255とする。処理速度重視のため方はVARCHARとする。
end
