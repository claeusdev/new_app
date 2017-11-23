class LineItemsController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:create]
	# before_action :set_line_item, only: [:show, :edit, :update, :destroy]



	def create
		product = Product.friendly.find(params[:product_id])
		@line_item = @cart.add_product(product)

		respond_to do |format|
			if @line_item.save
				format.html { redirect_to @line_item.cart,
					notice: "Product was successfully added to your cart."}
				format.js
				format.json { render :show, status: :created, location: @line_item}
			end
		end
	end

	def line_item_params
		params.require(:line_item).permit(:product_id)
	end
end
