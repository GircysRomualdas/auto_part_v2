class CreateCarParts < ActiveRecord::Migration[8.0]
  def change
    create_table :car_parts do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.references :car_model
      t.references :seller
      t.references :part_type
      t.timestamps
    end
  end
end
