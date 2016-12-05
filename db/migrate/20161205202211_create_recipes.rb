class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :recipe_name
      t.string :recipe_url
      t.integer :state_id

      t.timestamps

    end
  end
end
