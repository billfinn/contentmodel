class TemplateAudienceMapping < ApplicationRecord
  belongs_to :template
  belongs_to :audience

  accepts_nested_attributes_for :audience
end
