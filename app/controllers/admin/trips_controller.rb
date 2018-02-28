class Admin::TripsController < Admin::BaseController
  before_action :find_trip, only: [:edit, :show, :destroy, :update]

  def new
    @trip = Trip.new
  end

  def edit
  end

  def destroy
    id = @trip.id
    @trip.destroy
    flash[:notice] = "Trip ID#{id} deleted =("
    redirect_to trips_path
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.update(condition: find_condition_id(trip_params[:start_date]))
    if @trip.save
      flash[:notice] = "Trip ID#{@trip.id} created"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "Trip not created. Try again."
      redirect_to new_admin_trip_path
    end
  end

  def update
    if @trip.update(trip_params)
      flash[:notice] = "Trip ID#{@trip.id} updated ;)"
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

    def find_condition_id(start_date)
      date = start_date.to_datetime.strftime("%m-%d-%Y")
      Condition.find_by(date: date)
    end
end
