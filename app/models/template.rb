class Template < ApplicationRecord
   has_many :template_components
   has_many :components, :through => :template_components
   accepts_nested_attributes_for :template_components, :allow_destroy => true
end
