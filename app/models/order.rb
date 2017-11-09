class Order < ActiveRecord::Base
	belongs_to :store
	belongs_to :user
	belongs_to :order_status, optional: true
	has_one :product
	


	def total_price
		quantity * unit_price.to_i
	end
end