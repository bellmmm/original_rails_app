class CreateComposeds < ActiveRecord::Migration[6.0]
  def change
    create_table :composeds do |t|
      t.integer :product_id
      t.integer :feature_id

      t.timestamps
    end
    add_index :composeds, :product_id
    add_index :composeds, :feature_id
    add_index :composeds, [:product_id, :feature_id], unique: true
  end
end
