class CartsController < ApplicationController

  def create
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(params[:accessory])
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully added item"
    redirect_to bike_shop_path
  end

  def index
    @accessories = Hash.new
    @cart.contents.each_pair do |key, value|
      accessory = Accessory.find(key)
      @accessories[accessory] = value
    end
  end

end
