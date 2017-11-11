class PagesController < ApplicationController
  def index
  	@categories = Category.all.order('name asc').limit(2)
  end

  def contact
  end

  def about
  end
end
