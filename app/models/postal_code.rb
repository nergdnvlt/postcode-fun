class PostalCode < ApplicationRecord
  # Model Validations
  validates_presence_of :code
  validates_uniqueness_of :code

  # Model - DB Callbacks
  before_create :set_prefix

  # Relationships
  has_many :cafes

  private

  def set_prefix
    self.prefix = code.split(' ')[0]
  end
end
