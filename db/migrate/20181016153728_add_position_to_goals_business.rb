class AddPositionToGoalsBusiness < ActiveRecord::Migration[5.1]
  def change
    add_column :goals_businesses, :position, :integer
  end
end
