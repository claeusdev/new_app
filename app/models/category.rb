class Category < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  
	has_many :stores, dependent: :destroy
	validates :name, presence: true, uniqueness: true
end