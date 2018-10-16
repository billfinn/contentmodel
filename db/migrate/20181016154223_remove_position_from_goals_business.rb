class RemovePositionFromGoalsBusiness < ActiveRecord::Migration[5.1]
  def change
    remove_column :goals_businesses, :position, :string
  end
end
