class CreateTemplateBusinessGoalMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :template_business_goal_mappings do |t|
      t.integer :businessgoal_id
      t.string :template_id

      t.timestamps
    end
  end
end
