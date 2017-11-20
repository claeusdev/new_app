class OrdersController < ApplicationController
  def new
    product
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      redirect_to store_product_order_path(@order)
    end
  end

  private

  def product
    @product = Product.friendly.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:user_id, :total)
  end
end
