class CartsController < ApplicationController

  def create
    @accessory = Accessory.find(params[:accessory])
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(params[:accessory])
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully added #{@accessory.name}"
    if params[:previous_page] == "cart_page"
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

  def destroy
    @accessory = Accessory.find(params[:id])
    @cart = Cart.new(session[:cart])
    @cart.remove_accessory(params[:id])
    session[:cart] = @cart.contents
    flash[:notice] = %Q(Successfully removed #{@accessory.name} from your cart. #{view_context.button_to("Undo", carts_path(accessory: @accessory.id, previous_page: "cart_page"))}).html_safe
    redirect_to carts_path
  end
end
