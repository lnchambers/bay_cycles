class Admin::StationsController < Admin::BaseController
  before_action :find_station, only: [:edit, :update, :destroy]

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station created"
      redirect_to station_path(@station)
    else
      flash[:notice] = "Station not created. Try again."
      redirect_to new_admin_station_path
    end
  end

  def update
    if @station.update(station_params)
      flash[:notice] = "Station updated"
      redirect_to station_path(@station)
    else
      flash[:notice] = "Station not updated. Try again."
      redirect_to edit_admin_station_path(@station)
    end
  end

  def destroy
    @station.destroy
    flash[:notice] = "Station deleted =("
    redirect_to stations_path
  end

  private

    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end

    def find_station
      @station = Station.friendly.find(params[:id])
    end
end
