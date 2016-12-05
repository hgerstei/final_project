class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :purchase_name
      t.integer :category_id
      t.date :purchase_date
      t.text :notes
      t.integer :user_id

      t.timestamps

    end
  end
end
