class PageTemplateMapping < ApplicationRecord
  belongs_to :page
  belongs_to :template
end
