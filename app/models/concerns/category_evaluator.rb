module CategoryEvaluator
  # LS1 Category Classification
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

  # LS2 Category Classification
  def set_ls2_category
    Cafe.joins(:postal_code)
        .where(postal_codes: {prefix: 'LS2' })
        .each(&:adjust_percentile_rank)
  end

  def adjust_percentile_rank
    if percentile <= 50
      update!(category: 'ls2 small')
    else
      update!(category: 'ls2 large')
    end
  end

  # Other Category Classification
  def set_other_category
    update!(category: 'other')
  end
end