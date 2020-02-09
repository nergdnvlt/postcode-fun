class PagesController < ApplicationController
  def categories
    @categories = CategoriesPresenter.new
  end

  def welcome; end

  def print_small
    if SmallCategoryService.run
      flash[:success] = 'Successfully printed and deleted small category cafes'
    else
      flash[:error] = 'Did not print small category cafes'
    end
    redirect_to root_path
  end

  def alter
    if MedLargeCategoryService.run
      flash[:success] = 'Successfully altered medium and large cafes'
    else
      flash[:error] = 'Did not change medium and large category cafes'
    end
    redirect_to root_path
  end
end
