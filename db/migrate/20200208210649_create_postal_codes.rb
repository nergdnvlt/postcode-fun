class CreatePostalCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :postal_codes do |t|
      t.string :name
      t.string :prefix

      t.timestamps
    end
  end
end
