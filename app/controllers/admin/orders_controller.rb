class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
    # @ordered_accessories = OrderedAccessories.where(order_id: @order.id)
  end

end
