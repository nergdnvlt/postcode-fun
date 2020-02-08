class PostalCode < ApplicationRecord
  # Model Validations
  validates_presence_of :code
  validates_uniqueness_of :code

  # Model - DB Callbacks
  before_create :set_prefix

  # Relationships
  has_many :cafes

  def self.total_ls2_cafes
    Cafe.joins(:postal_code)
        .where(postal_codes: {prefix: 'LS2' })
        .count
  end

  private

  def set_prefix
    self.prefix = code.split(' ')[0]
  end
end
