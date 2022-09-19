class AddIndexToProductsProductUrl < ActiveRecord::Migration[6.0]
  def change
    add_index :products, :product_URL, unique: true 
  end
end
