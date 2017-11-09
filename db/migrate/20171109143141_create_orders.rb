class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.text :note
      t.references :store, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
