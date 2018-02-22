class AccessoryController < ApplicationController

  def index
    @accessories = Accessory.all
  end

end
