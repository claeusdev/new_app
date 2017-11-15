class PagesController < ApplicationController
  def index
  	@categories = Category.all.order('name asc').limit(2)
  	@meta_title = meta_title "Find and shop from Africa's emerging brands"
  	@meta_description = 'Discover Africa\'s most exciting brands and their products.'
  end

  def contact
  end

  def about
  end
end
