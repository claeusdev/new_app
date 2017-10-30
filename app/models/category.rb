class Category < ActiveRecord::Base

	has_many :products, dependent: :destroy
	has_many :stores, dependent: :destroy
	validates :name,  :uniqueness, presence: true
end