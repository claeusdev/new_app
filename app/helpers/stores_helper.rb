module StoresHelper

	def follow_button(store)
		if  current_user && current_user != store.user 
			if current_user.following?(store, current_user)
				button_to 'Unfollow', unfollow_store_path(store), method: :delete, class: "btn btn-danger btn-sm"
			else
				button_to 'Follow', follow_store_path(store), class: "btn btn-danger btn-sm"
			end
		end
	end
end

