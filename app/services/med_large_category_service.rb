class MedLargeCategoryService
  def self.run
    new.modify
  end

  def run
    return false if modify.includes?(false)

    true
  end

  def initialize
    @cafes = combine(
      Cafe.where(category: 'ls1 medium'),
      Cafe.where(category: 'ls1 large'),
      Cafe.where(category: 'ls2 large')
    )
  end

  def modify
    @cafes.map do |cafe|
      true if concat_category(cafe)
    end.uniq
  end

  def combine(cafes1, cafes2, cafes3)
    cafes1 | cafes2 | cafes3
  end

  def concat_category(cafe)
    cafe.update!(name: "#{cafe.category} #{cafe.name}")
  end
end