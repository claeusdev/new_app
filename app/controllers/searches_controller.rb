class SearchesController < ApplicationController
  def show
  	@products = Product.search(params[:q])
  end
end
