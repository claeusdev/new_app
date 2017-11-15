class MessagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@messages = current_user.messages
	end

	def create
		store
		@message = Message.new(message_params)
		@message.user_id = current_user.id
		@message.store_id = store.id
		if @message.save
			redirect_to store_product_path(product.store, product)
		end
	end


	def destroy
		
	end

	private

	def store
		@_store ||= Store.friendly.find(params[:store_id])
	end

	def message_params
		params.require(:message).permit(:body, :user_id, :store_id)
	end

end
