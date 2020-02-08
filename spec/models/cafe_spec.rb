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

    it 'correctly populates ls1 medium category small end' do
      post_code = PostalCode.create(code: 'LS1 5HU')
      cafe1 = post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 10
      )

      expect(cafe1.postal_code).to eq(post_code)
      expect(cafe1.category).to eq('ls1 medium')
    end

    it 'correctly populates ls1 medium category large end' do
      post_code = PostalCode.create(code: 'LS1 5HU')
      cafe1 = post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 99
      )

      expect(cafe1.postal_code).to eq(post_code)
      expect(cafe1.category).to eq('ls1 medium')
    end

    it 'correctly populates ls1 large category lower end' do
      post_code = PostalCode.create(code: 'LS1 5HU')
      cafe1 = post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 100
      )

      expect(cafe1.postal_code).to eq(post_code)
      expect(cafe1.category).to eq('ls1 large')
    end

    it 'correctly populates ls1 large category higher end' do
      post_code = PostalCode.create(code: 'LS1 5HU')
      cafe1 = post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 10000
      )

      expect(cafe1.postal_code).to eq(post_code)
      expect(cafe1.category).to eq('ls1 large')
    end

    it 'correctly populates other category' do
      post_code = PostalCode.create(code: 'LS5 5HU')
      cafe1 = post_code.cafes.create(
        name: "Fluffy's",
        address: '401 This Rocks',
        chairs: 100
      )

      expect(cafe1.postal_code).to eq(post_code)
      expect(cafe1.category).to eq('other')
    end

    it 'correctly populates ls2 small category' do
      post_code = PostalCode.create(code: 'LS2 5HU')

      cafe1 = post_code.cafes.create!(
        name: "Adios",
        address: '401 This Rocks',
        chairs: 100
      )
      cafe2 = post_code.cafes.create!(
        name: "Vamos",
        address: '403 This Rocks',
        chairs: 200
      )

      expect(cafe1.category).to eq('ls2 small')
      expect(cafe2.category).to eq('ls2 large')
    end
  end
end
