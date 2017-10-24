class Product < ApplicationRecord
	belongs_to :store

	has_many :assets, dependent: :destroy
	accepts_nested_attributes_for :assets, :allow_destroy => true
end
