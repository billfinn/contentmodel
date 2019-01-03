class CreateGoalsStrategyPillars < ActiveRecord::Migration[5.1]
  def change
    create_table :goals_strategy_pillars do |t|
      t.integer :goal_id
      t.string :strategy_pillar

      t.timestamps
    end
  end
end
