class Flow < ApplicationRecord
  has_many :template_flows
  has_many :templates, :through => :template_flows
  accepts_nested_attributes_for :template_flows, :allow_destroy => true

end
