class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.text :category
      t.boolean :available

      t.timestamps
    end
  end
end
