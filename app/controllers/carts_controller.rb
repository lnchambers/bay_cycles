class CartsController < ApplicationController

  def create
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(params[:accessory])
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully added item"
    if params[:previous_page]
      redirect_to carts_path
    else
      redirect_to bike_shop_path
    end
  end

  def index
    @accessories = Hash.new
    @cart.contents.each_pair do |key, value|
      accessory = Accessory.find(key)
      @accessories[accessory] = value
    end
  end

end
