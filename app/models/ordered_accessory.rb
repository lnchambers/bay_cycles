class OrderedAccessory < ApplicationRecord
  belongs_to :order
  belongs_to :accessory
end
