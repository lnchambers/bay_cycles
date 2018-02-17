class StationsController < ApplicationController
  before_action :find_station, only: [:edit, :show, :update, :destroy]
  before_action :require_admin, only: [:edit, :update, :destroy, :new]

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def show
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station created"
      redirect_to station_path(@station)
    else
      flash[:notice] = "Station not created. Try again."
      render :new
    end
  end

  def update
    if @station.update(station_params)
      redirect_to station_path(@station)
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_path
  end

  private

    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end

    def find_station
      @station = Station.find(params[:id])
    end

end
