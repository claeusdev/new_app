class Product < ApplicationRecord
	is_impressionable
	mount_uploader :image, ImageUploader

	belongs_to :store
	
	has_many :assets, dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :order, optional: true
	
	accepts_nested_attributes_for :assets, :allow_destroy => true

	searchkick text_start: [:name]

	def search_data
		{
			name: name,
			description: description
		}
	end
end
