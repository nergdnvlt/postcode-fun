class PostalCodesController < ApplicationController
  def index
    @posts = PostalCode.all
  end
end
