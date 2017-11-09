class AddOrderIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :order, foreign_key: true
  end
end
