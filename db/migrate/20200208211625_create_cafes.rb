class CreateCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.integer :chairs
      t.string :category

      t.timestamps
    end
  end
end
