class Admin::BikeShopController < Admin::BaseController

  def index
    @active_accessories = Accessory.where(role: 0)
    @inactive_accessories = Accessory.where(role: 1)
  end

end
