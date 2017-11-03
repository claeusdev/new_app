class FollowingsController < ApplicationController
	def create
		store_to_follow = find_store
		current_user.follow(store_to_follow, current_user)
		redirect_to store_to_follow
	end

	private

	def find_store
		@_store ||= Store.find(params[:id])
	end
end