class GoalsBusiness < ApplicationRecord
  has_many :template_business_goal_mappings
  has_many :templates, :through => :template_business_goal_mappings
  # accepts_nested_attributes_for :template_business_goal_mappings, :allow_destroy => true
end
