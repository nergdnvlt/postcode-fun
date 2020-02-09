require 'rails_helper'

describe 'User visits the root page' do
  describe 'to print all small category data' do
    it 'and delete all the cafes' do
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
      visit '/'

      click_button 'Small'

      # User sees the table data
      expect(current_path).to eq(root_path)

      small_ls1_cafes = Cafe.where(category: 'ls1 small')
      small_ls2_cafes = Cafe.where(category: 'ls2 small')

      expect(small_ls1_cafes.count).to eq(0)
      expect(small_ls2_cafes.count).to eq(0)
    end
  end
end