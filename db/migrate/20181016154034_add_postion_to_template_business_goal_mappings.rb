class AddPostionToTemplateBusinessGoalMappings < ActiveRecord::Migration[5.1]
  def change
    add_column :template_business_goal_mappings, :position, :integer
  end
end
