class Admin::TripsController < Admin::BaseController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Trip created"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "Trip not created. Try again."
      render :new
    end
  end

  def edit

  end

  def update
    if @trip.update(trip_params)
      flash[:notice] = "Trip updated ;)"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "Trip not updated. Try again."
      render :edit
    end
  end

  def destroy
    @trip.destroy
    flash[:notice] = "Trip deleted =("
    redirect_to trips_path
  end

  private

    def trip_params
      params.require(:trip).permit(:duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code)
    end

    def find_trip
      @trip = Trip.find(params[:id])
    end

end
