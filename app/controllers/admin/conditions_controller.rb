class Admin::ConditionsController < Admin::BaseController
  before_action :find_condition, only: [:edit, :update, :destroy]
  def new
    @condition = Condition.new
  end

  def edit
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:notice] = "Condition created"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Condition not created. Try again."
      redirect_to new_admin_condition_path
    end
  end

  def update
    if @condition = Condition.update(condition_params)
      flash[:notice] = "Condition updated"
      redirect_to condition_path(@condition)
    else
      flash[:notice] = "Station not updated. Try again."
      redirect_to edit_admin_condition_path(@condition)
    end
  end

  def destroy
    @condition.destroy
    flash[:notice] = "Condition deleted"
    redirect_to conditions_path
  end

  private

    def condition_params
      params.require(:condition).permit(:date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation)
    end

    def find_condition
      @condition = Condition.find(params[:id])
    end
end
