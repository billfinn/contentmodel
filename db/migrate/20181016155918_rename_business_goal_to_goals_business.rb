class RenameBusinessGoalToGoalsBusiness < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals_businesses, :businessgoal, :goals_business
  end
end
