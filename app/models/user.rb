class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  has_one :store, dependent: :destroy
  has_many :likes
  has_many :liked_products, through: :likes, source: :product
  has_many :followings
  has_many :followed_stores, through: :followings, source: :store
  has_many :orders
  def follow(store, user)
  	store.followers << user
  end


  def like(product)
  	liked_products << product
  end

  def liked?(product)
  	liked_product_ids.include?(product.id) 
  end

  def unlike(product)
  	liked_products.destroy(product)
  end
end
