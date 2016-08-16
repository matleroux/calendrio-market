class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.integer :max_capacity
      t.integer :price
      t.text :availability
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
