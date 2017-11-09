class Store < ApplicationRecord
  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings
  has_many :orders, dependent: :destroy

  validates :name, :about, presence: true
end
