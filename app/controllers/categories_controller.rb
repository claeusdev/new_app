class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
	end


	def create
		@category = Category.new(cat_params)

		if @category.save
			redirect_to @category
		end
	end

	private

	def cat_params
		params.require(:category).permit(:name, :parent_id)
	end
end