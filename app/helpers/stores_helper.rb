module StoresHelper

	def follow_button(store)
		if current_user != store.user
			if current_user.following?(store)
				button_to "UnFollow", unfollow_store_path, class: "btn btn-danger btn-sm"
			else
				button_to "Follow", follow_store_path, class: "btn btn-danger btn-sm"
			end
		end 
	end
end

