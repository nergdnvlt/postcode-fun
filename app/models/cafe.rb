class Cafe < ApplicationRecord
  include CategoryEvaluator

  # Fix Active Record Pluralization
  self.table_name = 'cafes'

  # Model Validations
  validates_presence_of :name, :address, :chairs

  # Model - DB Callbacks
  after_create :set_category

  # Relationships
  belongs_to :postal_code

  private

  def set_category
    case postal_code.prefix
    when 'LS1'
      set_ls1_category
    else
      set_other_category
    end
  end
end
