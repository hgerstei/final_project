class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :recommendation
      t.integer :state_id

      t.timestamps

    end
  end
end
