class CreateDislikes < ActiveRecord::Migration[6.0]
  def change
    create_table :dislikes do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :dislikes, :user_id
    add_index :dislikes, :product_id
    add_index :dislikes, [:user_id, :product_id], :unique => true
  end
end
