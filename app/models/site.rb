class Site < ApplicationRecord
  has_many :pages

  has_many :site_template_mappings
  has_many :templates, :through => :site_template_mappings
  accepts_nested_attributes_for :site_template_mappings, :allow_destroy => true

end
