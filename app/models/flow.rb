class Flow < ApplicationRecord
  has_many :template_flows
  has_many :templates, -> { order('template_flows.position') },  :through => :template_flows
  accepts_nested_attributes_for :template_flows, :allow_destroy => true

end
