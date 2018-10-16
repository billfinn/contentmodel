class RenameGoalToBusinessGoal < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals_businesses, :goal, :businessgoal
  end
end
