class TemplateCustomerGoalMapping < ApplicationRecord
  belongs_to :template
  belongs_to :goals_customer

  accepts_nested_attributes_for :goals_customer
end
