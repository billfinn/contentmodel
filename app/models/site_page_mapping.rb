class SitePageMapping < ApplicationRecord
  belongs_to :site
  belongs_to :page
end
