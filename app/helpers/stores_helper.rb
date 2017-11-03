module StoresHelper

	def follow_button(store)
		if current_user != store.user
			if user_signed_in?
				if current_user.following?(store)
					button_to "UnFollow", unfollow_store_path, class: "btn btn-danger btn-sm"
				else
					button_to "Follow", follow_store_path, class: "btn btn-danger btn-sm"
				end
			end
			link_to "Join to follow this store and get new products in your email", new_user_registration_path
		end 
	end
end

