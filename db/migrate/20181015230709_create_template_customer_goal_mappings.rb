class CreateTemplateCustomerGoalMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :template_customer_goal_mappings do |t|
      t.integer :customergoal_id
      t.integer :template_id

      t.timestamps
    end
  end
end
