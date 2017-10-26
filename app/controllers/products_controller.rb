class ProductsController < ApplicationController

	def create
		@store = Store.find(params[:store_id])
		@product = Product.new(product_params)
		@product.store_id = @store.id
		if @product.save
			respond_to do |f|
				f.js
			end
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :stock, :store_id, :image, assets_attributes: [:image])
	end
end
