class ChangeTripsConditionIdToAllowNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:trips, :condition_id, true, "Bad Admin! Condition DNE")
  end
end
