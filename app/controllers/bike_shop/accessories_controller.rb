class BikeShop::AccessoriesController < BikeShop::BaseController

  def index
    @accessories = Accessory.all
  end

end
