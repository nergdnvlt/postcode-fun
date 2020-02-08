class Cafe < ApplicationRecord
  include CategoryEvaluator

  # Fix Active Record Pluralization
  self.table_name = 'cafes'

  # Validations
  validates_presence_of :name, :address, :chairs

  # Relationships
  belongs_to :postal_code

  # Model - DB Callbacks
  after_create :set_category

  private

  def set_category
    case postal_code.prefix
    when 'LS1'
      set_ls1_category
    end
  end
end
