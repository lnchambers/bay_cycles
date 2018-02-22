class ConditionsController < ApplicationController

  def index
    @conditions = Condition.all
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:notice] = "Condition created"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Condition not created. Try again."
      render :new
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    if @condition = Condition.update(condition_params)
      flash[:notice] = "Condition updated"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Station not updated. Try again."
      render :edit
    end

  end

    private
      def condition_params
        params.require(:condition).permit(:date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation)
      end
end