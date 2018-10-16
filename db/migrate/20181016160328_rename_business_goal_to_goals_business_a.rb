class RenameBusinessGoalToGoalsBusinessA < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals_businesses, :name
  end
end
