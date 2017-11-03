class DashboardsController < ApplicationController
	before_action :authenticate_user!
	def show
		@product = Product.new
		4.times { @product.assets.build }
		@store = Store.find(params[:store_id])
	end
end