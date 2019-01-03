class GoalsCustomer < ApplicationRecord
  has_many :template_customer_goal_mappings
  has_many :templates, :through => :template_customer_goal_mappings
  # accepts_nested_attributes_for :template_customer_goal_mappings, :allow_destroy => true
end
