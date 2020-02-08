class PagesController < ApplicationController
  def categories
    @categories = CategoriesPresenter.new
  end
end
