class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

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

  private

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
