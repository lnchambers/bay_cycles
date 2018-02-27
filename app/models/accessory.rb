class Accessory < ApplicationRecord
  validates_presence_of :name, :description, :price, :role

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_many :ordered_accessories
  has_many :orders, through: :ordered_accessories

  def total_quantity
    ordered_accessories.sum do |ordered_accessory|
      ordered_accessory.quantity
    end
  end
end
