class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :category_id
      t.string :stage1
      t.string :stage2
      t.string :stage3
      t.string :stage4

      t.timestamps

    end
  end
end
