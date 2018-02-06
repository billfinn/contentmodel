class Template < ApplicationRecord
   has_many :template_components
   has_many :components, -> { order('template_components.position') }, :through => :template_components
   accepts_nested_attributes_for :template_components, :allow_destroy => true

   has_many :hierarchy_mappings
   has_many :hierarchies, :through => :hierarchy_mappings
   accepts_nested_attributes_for :hierarchy_mappings, :allow_destroy => true

   has_many :site_template_mappings
   has_many :sites, :through => :site_template_mappings
   accepts_nested_attributes_for :site_template_mappings, :allow_destroy => true

end
