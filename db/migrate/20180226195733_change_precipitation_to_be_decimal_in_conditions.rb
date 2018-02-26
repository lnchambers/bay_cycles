class ChangePrecipitationToBeDecimalInConditions < ActiveRecord::Migration[5.1]
  def change
    change_column :conditions, :precipitation, :decimal
  end
end
