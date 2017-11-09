class AddUnitPriceToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :unit_price, :decimal
  end
end
