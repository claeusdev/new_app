class CartsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

	def show
		@cart = Cart.find(params[:id])
	end


	def destroy
		@cart.destroy if @cart.id == session[:cart_id]
		session[:cart_id] = nil
		respond_to do |format|
		format.html { redirect_to root_path,
		notice: 'Your cart is currently empty' }
		format.json { head :no_content }
		end
	end

	private

	def invalid_cart
		logger.error "Attempt to access invalid cart #{params[:id]}"
		redirect_to root_url, notice: "Your cart cannot be found"
	end
end
