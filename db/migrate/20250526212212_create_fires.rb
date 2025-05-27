class CreateFires < ActiveRecord::Migration[8.0]
  def change
    create_table :fires do |t|
      t.string :maker
      t.string :model
      t.string :date

      t.timestamps
    end
  end
end
