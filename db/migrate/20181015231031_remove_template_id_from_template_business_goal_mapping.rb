class RemoveTemplateIdFromTemplateBusinessGoalMapping < ActiveRecord::Migration[5.1]
  def change
    remove_column :template_business_goal_mappings, :template_id, :string
  end
end
