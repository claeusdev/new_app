class OrdersController < ApplicationController

	before_action :ensure_cart_not_empty, only: [:new]

	def create
		@order = Order.new(order_params)
		@order.add_line_items_from_cart(@cart)
		respond_to do |format|
			if @order.save
				Cart.destroy(session[:cart_id])
				session[:cart_id] = nil
				format.html { redirect_to Order, notice:
				'Thank you for your order.' }
				format.json { render :show, status: :created,
				location: @order }
			else
				format.html { render :new }
				format.json { render json: @order.errors,
				status: :unprocessable_entity }
			end
		end
	end

	private

	def ensure_cart_not_empty
		if @cart.line_items.empty?
			redirect_to root_url, notice: "Your cart is empty"
			
		end
	end

	def order_params
		params.require(:order).permit(:name, :address, :email, :phone, :pay_type)
	end
end
