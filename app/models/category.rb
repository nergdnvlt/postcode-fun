class Category
  attr_reader :name

  def initialize(category)
    @cafes = Cafe.where(category: category)
    @name = category
  end

  def number_of_cafes
    @cafes.count
  end

  def number_of_chairs
    @cafes.sum(:chairs)
  end
end