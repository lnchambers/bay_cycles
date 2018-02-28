class Accessory < ApplicationRecord
  validates_presence_of :name, :description, :price, :role

  has_attached_file :image,
  :styles => { :medium => "200x200>", :thumb => "100x100>" },
  :default_url => "https://i.pinimg.com/736x/53/10/e0/5310e0e6382af61565718f90e8502233--baby-nerd-hipster-babies.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_many :ordered_accessories
  has_many :orders, through: :ordered_accessories

  def total_quantity
    ordered_accessories.sum do |ordered_accessory|
      ordered_accessory.quantity
    end
  end
end
