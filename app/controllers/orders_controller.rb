class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    if current_user
      @order = Order.new
    else
      flash[:notice] = "Please login first"
      redirect_to login_path
    end
  end

  def create
    if current_user
      @order = Order.new(order_params)
      @order.user_id = params[:user_id].keys[0]
      @order.status = params[:status].keys[0]
      if @order.save
        session[:cart].each do |order|
          OrderedAccessory.create!(accessory_id: order[0], order_id: @order.id, quantity: order[1])
        end
        flash[:notice] = "You have successfully submitted your order!"
        redirect_to dashboard_path(current_user)
      else

      end
    else
      redirect_to login_path
    end
  end

  private

    def order_params
      params.require(:order).permit(:purchaser_name, :purchaser_address)
    end

end
