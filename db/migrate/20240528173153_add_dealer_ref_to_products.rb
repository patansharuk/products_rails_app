class AddDealerRefToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :dealer_detail, foreign_key: true
  end
end
