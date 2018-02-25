class Admin::StationsController < Admin::BaseController
  def new
    @station = Station.new
  end

  def edit
    @station = Station.friendly.find(params[:id])
  end
end
