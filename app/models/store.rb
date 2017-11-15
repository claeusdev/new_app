class Store < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
	is_impressionable
	
  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, :about, presence: true


  def self.orders
  	Order.where(store_id: store.id)
  end
end
