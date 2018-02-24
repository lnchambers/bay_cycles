class TripsController < ApplicationController
  before_action :find_trip, only: [:show]

  def index
    @trips = Trip.order(:start_date).page params[:page]
  end

  def show
  end

  private

    def find_trip
      @trip = Trip.find(params[:id])
    end
end
