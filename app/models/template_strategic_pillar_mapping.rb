class TemplateStrategicPillarMapping < ApplicationRecord
  belongs_to :template
  belongs_to :goals_strategy_pillar

  accepts_nested_attributes_for :goals_strategy_pillar
end
