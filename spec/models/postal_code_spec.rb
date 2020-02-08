require 'rails_helper'

RSpec.describe PostalCode, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :code }
    # it { should validate_uniqueness_of :code }
  end

  describe 'Relationships' do
    it { should have_many :cafes }
  end

  describe 'Instance Methods' do
    it 'saves the prefix correctly' do
      post = PostalCode.create!(code: 'LS1 ZHU')

      expect(post.prefix).to eq('LS1')
    end

    it 'correctly calculates number of ls2 cafes' do
      post_code = PostalCode.create(code: 'LS2 5HU')

      post_code.cafes.create!(
        name: 'Adios',
        address: '401 This Rocks',
        chairs: 100
      )
      post_code.cafes.create!(
        name: 'Vamos',
        address: '403 This Rocks',
        chairs: 200
      )

      expect(PostalCode.total_ls2_cafes).to eq(2)
    end
  end
end
