require 'rails_helper'

RSpec.describe Cafe, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :chairs }
  end

  describe 'Relationships' do
    it { should belong_to :postal_code }
  end

  describe 'Instance Methods' do
    it 'correctly populates ls1 small category' do
      post_code = PostalCode.create(code: 'LS1 5HU')
      cafe1 = post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 9
      )

      expect(cafe1.postal_code).to eq(post_code)
      expect(cafe1.category).to eq('ls1 small')
    end
  end
end
