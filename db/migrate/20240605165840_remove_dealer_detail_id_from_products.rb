class RemoveDealerDetailIdFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_reference :products, :dealer_detail, index: true
    add_reference :products, :store, index: true
  end
end
