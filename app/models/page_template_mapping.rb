class PageTemplateMapping < ApplicationRecord
  belongs_to :page
  belongs_to :template

  accepts_nested_attributes_for :page
  accepts_nested_attributes_for :template


end
