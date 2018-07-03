class TemplateComponent < ApplicationRecord
  belongs_to :template
  belongs_to :component

  accepts_nested_attributes_for :component

end
