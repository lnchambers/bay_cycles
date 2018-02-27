class Admin::DashboardController < Admin::BaseController

  def show
    @orders = Order.all
    @status_orders = find_by_status
  end

  private

    def find_by_status
      case params[:status]
      when "Ordered"
        Order.ordered
      when "Paid"
        Order.paid
      when "Cancelled"
        Order.cancelled
      when "Completed"
        Order.completed
      else
        []
      end
    end
end
