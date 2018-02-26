class Admin::AccessoriesController < Admin::BaseController
  before_action :find_accessory, only: [:edit, :update, :show]

  def edit
  end

  def new
    @accessory = Accessory.new
  end

  def show
  end

  def create
    @accessory = Accessory.new(accessory_params)
    if @accessory.save
      flash[:notice] = "Accessory created"
      redirect_to admin_accessory_path(@accessory)
    else
      flash[:notice] = "Accessory not created. Try again."
      render :new
    end
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
