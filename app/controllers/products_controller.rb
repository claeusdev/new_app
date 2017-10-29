class ProductsController < ApplicationController

	def autocomplete
		render json: Product.search(params[:term], fields: [{name: :text_start}], limit: 10).map(&:name)
	end

	def create
		@store = current_user.store
		@product = Product.new(product_params)
		@product.store_id = @store.id
		if @product.save
			respond_to do |f|
				f.html { redirect_to store_dashboard_path(@store)}
			end
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :stock, :store_id, :image, :category_id, assets_attributes: [:image])
	end
end
