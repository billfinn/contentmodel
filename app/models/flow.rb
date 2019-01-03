class Flow < ApplicationRecord
  has_many :template_flows
  has_many :templates, -> { order('template_flows.position') },  :through => :template_flows
  accepts_nested_attributes_for :template_flows, :allow_destroy => true

  has_many :site_flow_mappings
  has_many :sites, -> { order('site_flow_mappings.order') }, :through => :site_flow_mappings
  accepts_nested_attributes_for :site_flow_mappings, :allow_destroy => true

end
