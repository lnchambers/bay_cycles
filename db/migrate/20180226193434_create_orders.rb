class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.text :purchaser_name
      t.text :purchaser_address
      t.text :status

      t.timestamps
    end
  end
end
