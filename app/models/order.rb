class Order < ApplicationRecord
  validates_presence_of :purchaser_name, :purchaser_address, :status, :user_id
  belongs_to :user
  has_many :ordered_accessories
  has_many :accessories, through: :ordered_accessories

  def total_cost
    ordered_accessories.sum do |ordered_accessory|
      Accessory.find(ordered_accessory.accessory_id).price * ordered_accessory.quantity
    end
  end

  def self.completed
    where(status: "Completed")
  end

  def self.ordered
    where(status: "Ordered")
  end

  def self.cancelled
    where(status: "Cancelled")
  end

  def self.paid
    where(status: "Paid")
  end
end
