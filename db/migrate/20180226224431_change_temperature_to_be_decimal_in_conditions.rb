class ChangeTemperatureToBeDecimalInConditions < ActiveRecord::Migration[5.1]
  def change
    change_column :conditions, :max_temperature, :decimal
  end
end
