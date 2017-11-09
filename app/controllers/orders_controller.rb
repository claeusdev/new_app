class OrdersController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  def new
  	product
  	@order = Order.new
  end

  def create
  	product
  	@order = Order.new(order_params)
  	@order.store_id = product.store.id
  	@order.user_id = current_user.id
  	@order.product = product
  	if @order.save
  		redirect_to store_product_order_path(product, product.store, @order), notice: "You've successfully ordered #{product.name}"
  	end
  end

  def show
  end

  def index
  end


  private

  def order_params
  	params.require(:order).permit(:quantity, :note, :product_id, :store_id, :user_id)
  end

  def product
  	@product = Product.find(params[:product_id])
  end
end
