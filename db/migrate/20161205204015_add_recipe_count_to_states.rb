class AddRecipeCountToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :recipes_count, :integer
  end
end
