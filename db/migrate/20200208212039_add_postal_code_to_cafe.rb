class AddPostalCodeToCafe < ActiveRecord::Migration[5.2]
  def change
    add_reference :cafes, :postal_code, foreign_key: true
  end
end
