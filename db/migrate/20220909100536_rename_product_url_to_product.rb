class RenameProductUrlToProduct < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :product_URL, :product_name
  end
end
