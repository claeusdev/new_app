class FollowingsController < ApplicationController
	def create
		store_to_follow = find_store
		current_user.follow(store_to_follow, current_user)
		redirect_to store_to_follow
	end

	def destroy
		store_to_unfollow = find_store
		current_user.unfollow(store_to_unfollow, current_user)
		redirect_to store_to_unfollow
	end

	private

	def find_store
		@_store ||= Store.friendly.find(params[:id])
	end
end