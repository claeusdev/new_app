class Product < ApplicationRecord
	searchkick
	mount_uploader :image, ImageUploader

	belongs_to :store
	belongs_to :category
	
	has_many :assets, dependent: :destroy
	accepts_nested_attributes_for :assets, :allow_destroy => true
end
