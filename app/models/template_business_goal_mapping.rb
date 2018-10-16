class TemplateBusinessGoalMapping < ApplicationRecord
  belongs_to :template
  belongs_to :goals_business

  accepts_nested_attributes_for :goals_business

end
