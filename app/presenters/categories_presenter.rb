class CategoriesPresenter
  attr_reader :categories

  def initialize
    @ls1_small ||= Category.new('ls1 small')
    @ls1_medium ||= Category.new('ls1 medium')
    @ls1_large ||= Category.new('ls1 large')
    @ls2_small ||= Category.new('ls2 small')
    @ls2_large ||= Category.new('ls2 large')
    @other ||= Category.new('other')
    @categories = [@ls1_small, @ls1_medium, @ls1_large, @ls2_small, @ls2_large, @other]
  end
end