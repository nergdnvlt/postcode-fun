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
end
