class DashboardsController < ApplicationController
	before_action :authenticate_user!
	def show
		@product = Product.new
		4.times { @product.assets.build }
		@store = Store.friendly.find(params[:store_id])
		# @orders = store.orders
	end

end