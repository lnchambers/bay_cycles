class Order < ApplicationRecord
  validates_presence_of :purchaser_name, :purchaser_address, :status, :user_id
  belongs_to :user
  has_many :ordered_accessories
  has_many :accessories, through: :ordered_accessories
end
