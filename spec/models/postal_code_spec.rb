require 'rails_helper'

RSpec.describe PostalCode, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :code }
    it { should validate_uniqueness_of :code }
  end
end
