class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.text :name
      t.text :description
      t.integer :price
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
