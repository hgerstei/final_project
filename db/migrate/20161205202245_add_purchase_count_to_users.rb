class AddPurchaseCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :purchases_count, :integer
  end
end
