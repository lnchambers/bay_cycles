class Admin::AccessoriesController < Admin::BaseController
  before_action :find_accessory, only: [:edit, :update]

  def edit
  end

  def update
    if @accessory.update(accessory_params)
      flash[:notice] = "Accessory updated"
      redirect_to admin_bike_shop_path
    else
      flash[:notice] = "Accessory not updated. Try again."
      render :edit
    end
  end

  private

    def find_accessory
      @accessory = Accessory.find(params[:id])
    end

    def accessory_params
      params.require(:accessory).permit(:name, :description, :price, :role)
    end
end
