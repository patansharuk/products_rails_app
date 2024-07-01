class CreateDealerDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :dealer_details do |t|
      t.string :name
      t.string :location
      t.integer :rating
      t.references :user, null: false, index: {unique: true}, foreign_key: true

      t.timestamps
    end
  end
end
