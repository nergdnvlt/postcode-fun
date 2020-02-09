class Cafe < ApplicationRecord
  include CategoryEvaluator
  include CsvInfo

  # Fix Active Record Pluralization
  self.table_name = 'cafes'

  # Model Validations
  validates_presence_of :name, :address, :chairs

  # Model - DB Callbacks
  after_create :set_category

  # Relationships
  belongs_to :postal_code

  def self.chairs
    Cafe.sum(:chairs)
  end

  def self.headers
    CsvInfo.headers
  end

  def percentile
    (location.to_f / PostalCode.total_ls2_cafes.to_f) * 100
  end

  private

  def set_category
    case postal_code.prefix
    when 'LS1'
      set_ls1_category
    when 'LS2'
      set_ls2_category
    else
      set_other_category
    end
  end

  # Percentile Calculation
  def location
    sorted_cafe_chairs.find_index(chairs) + index_offset
  end

  def index_offset
    return number_at_index / 2 if number_at_index.to_i.even?

    number_at_index.floor
  end

  def number_at_index
    Cafe.joins(:postal_code)
        .where(postal_codes: {prefix: 'LS2' })
        .where(chairs: chairs).count.to_f
  end

  def sorted_cafe_chairs
    Cafe.joins(:postal_code)
        .where(postal_codes: {prefix: 'LS2' })
        .map(&:chairs)
        .sort
  end
end
