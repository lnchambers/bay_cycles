class RemoveConditionFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :trips, :conditions
  end
end
