class SiteTagMapping < ApplicationRecord
  belongs_to :site
  belongs_to :tag

  scope :jci, -> { where(site_id: 1) }
end
