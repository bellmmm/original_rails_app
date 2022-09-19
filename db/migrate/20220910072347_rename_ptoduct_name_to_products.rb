class RenamePtoductNameToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :product_name, :name
  end
end
