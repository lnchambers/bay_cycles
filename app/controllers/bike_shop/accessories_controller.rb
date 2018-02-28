class BikeShop::AccessoriesController < BikeShop::BaseController

  def index
    @accessories = Accessory.all
  end

  def show
    @accessory = Accessory.find(params[:id])
  end

end
