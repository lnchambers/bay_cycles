class BikeShop::BaseController < ApplicationController
  before_each :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
