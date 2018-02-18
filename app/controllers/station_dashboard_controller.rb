class StationDashboardController < ApplicationController
  before_action :require_user

  def index
    @stations = Station.all
  end

end
