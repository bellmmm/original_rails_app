class AddPhotoByToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :photo_by, :string
  end
end
