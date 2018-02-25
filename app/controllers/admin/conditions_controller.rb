class Admin::ConditionsController < Admin::BaseController
  def new
    @conditon = Condition.new
  end

  def edit
    @conditon = Condition.find(params[:id])
  end
end
