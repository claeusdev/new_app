class Store < ApplicationRecord
  belongs_to :user

  accepts_nested_attributes_for :user

  has_many :products, dependent: :destroy

  validates :name, :about, presence: true
end
