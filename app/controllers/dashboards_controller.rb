class DashboardsController < ApplicationController
	def show
		@store = Store.find(params[:store_id])

		@product = Product.new
		4.times { @product.assets.build }
	end
end