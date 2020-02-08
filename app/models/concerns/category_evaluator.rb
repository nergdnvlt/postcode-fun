module CategoryEvaluator
  def set_ls1_category
    if chairs < 10
      update!(category: 'ls1 small')
    end
  end
end