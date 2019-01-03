class GoalsStrategyPillar < ApplicationRecord
  has_many :template_strategic_pillar_mappings
  has_many :templates, :through => :template_strategic_pillar_mappings
  # accepts_nested_attributes_for :template_strategic_pillar_mappings, :allow_destroy => true
end
