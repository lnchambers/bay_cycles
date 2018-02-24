class Admin::TripsController < Admin::BaseController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.new
  end

  def edit

  end

  private

    def find_trip
      @trip = Trip.find(params[:id])
    end

end
