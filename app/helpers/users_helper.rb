module UsersHelper


	def gravatar_url(user)
		"//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}"
	end
end
