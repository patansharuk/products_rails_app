class ChangeTableName < ActiveRecord::Migration[7.1]
  def change
    rename_table :dealer_details, :stores 
  end
end
