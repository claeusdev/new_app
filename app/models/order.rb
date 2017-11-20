class Order < ApplicationRecord
  belongs_to :user

  validates :total, presence: true,
                      numericality: { greater_than_or_equal_to: 0 }

  validates :user_id, presence: true

  has_one :line_item
  has_one :product, through: :line_items


  def order_total
    product.price * quantity
  end
end
