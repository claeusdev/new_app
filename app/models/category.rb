class Category < ActiveRecord::Base

	has_many :stores, dependent: :destroy
	validates :name, presence: true, uniqueness: true
end