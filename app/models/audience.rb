class Audience < ApplicationRecord
  has_many :audience_messages

  has_many :template_audience_mappings
  has_many :templates, :through => :template_audience_mappings
  accepts_nested_attributes_for :template_audience_mappings

end
