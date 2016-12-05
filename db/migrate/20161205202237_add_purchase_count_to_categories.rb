class AddPurchaseCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :purchases_count, :integer
  end
end
