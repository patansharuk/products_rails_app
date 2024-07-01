class AddFieldsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :price, :integer
    add_column :products, :image_url, :string
  end
end
