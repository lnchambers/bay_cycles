class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_secure_password
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :name, :email

  enum role: ["default", "admin"]

  has_many :orders
end
