class DashboardsController < ApplicationController
	before_action :authenticate_user!
	def show
		@store = Store.find(params[:store_id])
	end
end