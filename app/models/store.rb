class Store < ApplicationRecord
  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :followings
  has_many :followers, through: :followings

  validates :name, :about, presence: true
end
