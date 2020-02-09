require 'csv'

class SmallCategoryService

  def self.run
    new.run
  end

  def run
    print_csv

    delete_all
  end

  def initialize
    @cafe_objs = combine(Cafe.where(category: 'ls1 small'), Cafe.where(category: 'ls2 small'))
    @cafes = map_attrs
  end

  private

  def print_csv
    CSV.open(
      './lib/assets/small_cafes.csv',
      'wb',
      write_headers: true,
      headers: Cafe.headers
    ) do |csv|
      @cafes.each do |cafe|
        csv << cafe
      end
    end
  end

  def delete_all
    return true if @cafe_objs.each(&:destroy)

    false
  end

  def map_attrs
    @cafe_objs.map(&:csv_format)
  end

  def combine(cafe_group1, cafe_group2)
    cafe_group1 | cafe_group2
  end
end