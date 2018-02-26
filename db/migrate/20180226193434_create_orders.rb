class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.text :purchaser_name
      t.text :purchaser_address
      t.text :item_name
      t.text :item_quantity
      t.integer :item_price
      t.text :status

      t.timestamps
    end
  end
end
