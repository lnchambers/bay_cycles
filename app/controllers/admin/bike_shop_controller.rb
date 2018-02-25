class Admin::BikeShopController < Admin::BaseController

  def index
    @accessories = Accessory.all
  end

end
