require 'rails_helper'

RSpec.describe PostalCode, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :code }
    it { should validate_uniqueness_of :code }
  end

  describe 'Instance Methods' do
    it 'saves the prefix correctly' do
      post = PostalCode.create!(code: 'LS1 ZHU')

      expect(post.prefix).to eq('LS1')
    end
  end
end
