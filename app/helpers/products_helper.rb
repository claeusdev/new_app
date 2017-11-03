module ProductsHelper
	

	def like_button(product)
		if current_user.liked?(product)
			link_to "Unlike", unlike_store_product_path(product), method: :delete, class: "btn btn-danger btn-sm"
		else
			link_to "Like", like_store_product_path(product), method: :post, class: "btn btn-danger btn-sm"
		end
	end
end
