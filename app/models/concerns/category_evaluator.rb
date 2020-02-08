module CategoryEvaluator
  def set_ls1_category
    if ls1_small?
      update!(category: 'ls1 small')
    elsif ls1_medium?
      update!(category: 'ls1 medium')
    else
      update!(category: 'ls1 large')
    end
  end

  def ls1_small?
    chairs < 10
  end

  def ls1_medium?
    chairs >= 10 && chairs < 100
  end
end