class CreateStores < ActiveRecord::Migration[5.1]
  def change

  	create_table :categories do |t|
  		t.string :name
  		t.timestamps
  		
  	end
    create_table :stores do |t|
      t.string :name
      t.text :about
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
