require 'rails_helper'

describe 'User visits the postal code page' do
  describe 'to see aggregate Postal Code data' do
    it 'to give them info on Restuarants' do
      post_code = PostalCode.create(code: 'LS1 5HU')
      post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 9
      )
      post_code.cafes.create(
        name: "Bob's",
        address: '402 This Rocks',
        chairs: 10
      )
      post_code.cafes.create(
        name: "Thor's",
        address: '402 This Rocks',
        chairs: 1000
      )

      post_code2 = PostalCode.create(code: 'LS2 5HU')
      post_code.cafes.create!(
        name: "Ma's",
        address: '402 This Rocks',
        chairs: 1000
      )
      post_code2.cafes.create!(
        name: "Joe's",
        address: '400 This Rocks',
        chairs: 10
      )
      post_code2.cafes.create!(
        name: "Caroline's",
        address: '400 This Rocks',
        chairs: 100
      )
      post_code2.cafes.create!(
        name: "Alicia's",
        address: '400 This Rocks',
        chairs: 600
      )

      post_code3 = PostalCode.create(code: 'LS3 5HU')
      post_code3.cafes.create!(
        name: "Max's",
        address: '402 This Rocks',
        chairs: 1000
      )

      # User visits the root page
      visit '/postal_codes'

      expect(current_path).to eq(postal_codes_path)

      # User sees the table data
      expect(page).to have_content('Total Cafes')
      expect(page).to have_content('Total Chairs')
      expect(page).to have_content('Chair Percentage')
      expect(page).to have_content('Max Chairs')
    end
  end
end