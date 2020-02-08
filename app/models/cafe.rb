class Cafe < ApplicationRecord
  self.table_name = 'cafes'

  validates_presence_of :name, :address, :chairs

  belongs_to :postal_code
end
