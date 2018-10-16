class RenameBusinessGoalIdToGoalsBusinessId < ActiveRecord::Migration[5.1]
  def change
    rename_column :template_business_goal_mappings, :businessgoal_id, :goals_business_id
  end
end
