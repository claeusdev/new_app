module UsersHelper


	def gravatar_url(user)
		unless current_user.avatar.present?
			"//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}"
		end
	end
end
