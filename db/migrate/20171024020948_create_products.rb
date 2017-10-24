class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, default: 0
      t.integer :stock, default: 0
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
