class Order < ApplicationRecord
  validates_presence_of :purchaser_name, :purchaser_address, :item_name, :item_quantity, :item_price, :status, :user_id
end
