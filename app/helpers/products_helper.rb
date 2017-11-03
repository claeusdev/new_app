module ProductsHelper
	

	def like_button(product)
		if user_signed_in?
			if current_user.liked?(product)
				link_to "Unlike", unlike_store_product_path(product), method: :delete, class: "btn btn-danger btn-sm"
			else
				link_to "Like", like_store_product_path(product), method: :post, class: "btn btn-danger btn-sm"
			end
		else
			link_to "Join to like and save products", new_user_registration_path
		end
	end
end
