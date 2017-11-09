class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
  	product
  	@order = Order.new
  end

  def create
    product
  	@order = current_user.orders.build(order_params)
    @order.store_id = product.store.id
    @order.product_id = product.id
    @order.unit_price = product.price
    if @order.save
      redirect_to store_product_order_path(product.store, product, @order)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
  end


  private

  def order_params
  	params.require(:order).permit(:total, :store_id, :product_id, :quantity)
  end

  def product
  	@product = Product.find(params[:product_id])
  end
end
