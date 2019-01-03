class SiteTemplateMapping < ApplicationRecord
  belongs_to :site
  belongs_to :template 
end
