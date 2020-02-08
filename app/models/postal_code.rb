class PostalCode < ApplicationRecord
  validates_presence_of :code
  validates_uniqueness_of :code

  before_create :set_prefix

  private

  def set_prefix
    self.prefix = code.split(' ')[0]
  end
end
