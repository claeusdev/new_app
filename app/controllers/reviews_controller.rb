class ReviewsController < ApplicationController

	def create
		store
		@review = Review.new(review_params)
		@review.store_id = store.id
		@review.user_id = current_user.id
		if @review.save
			redirect_to store_path(@store)
		end
	end


	private

	def store
		@store ||= Store.find(params[:store_id])
	end


	def review_params
		params.require(:review).permit(:rating, :comment, :store_id, :user_id)
	end
end
