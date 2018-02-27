class TripsDashboardController < ApplicationController
  before_action :require_user

  def index
    @trips = Trip.all
    @conditions = Condition.all
  end
end
