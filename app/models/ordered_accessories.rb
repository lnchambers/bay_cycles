class OrderedAccessories < ApplicationRecord
  belongs_to :order
  belongs_to :accessory
end
