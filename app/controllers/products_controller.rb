class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@store = current_user.store
		@product = Product.new(product_params)
		@product.store_id = @store.id

		respond_to do |format|
			if @product.save
				format.html { redirect_to store_dashboard_path(@store)}
			end
		end
	end

	def show
		@product = Product.find(params[:id])
		impressionist(@product)
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :stock, :store_id, :image, assets_attributes: [:image])
	end
end
