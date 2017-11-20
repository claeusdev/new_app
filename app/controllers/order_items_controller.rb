class OrderItemsController < ApplicationController
	def create
		@order_item = OrderItem.new(order_item_params)
		if @order_item.save
			redirect_to @order_item
		end
	end

	private

	def order_item_params
		params.require(:order_item).permit(:order_id, :product_id)
	end
end