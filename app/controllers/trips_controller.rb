class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :destroy, :update]
  before_action :require_admin, only: [:destroy, :create, :update]

  def index
    @trips = Trip.order(:start_date).page params[:page]
  end

  def show
  end

  def destroy
    @trip.destroy
    flash[:notice] = "Trip deleted =("
    redirect_to trips_path
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Trip created"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "Trip not created. Try again."
      redirect_to new_admin_trip_path
    end
  end

  def update
    if @trip.update(trip_params)
      flash[:notice] = "Trip updated ;)"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "Trip not updated. Try again."
      redirect_to edit_admin_trip_path(@trip)
    end
  end

  private

    def trip_params
      params.require(:trip).permit(:duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code)
    end

    def find_trip
      @trip = Trip.find(params[:id])
    end
end
