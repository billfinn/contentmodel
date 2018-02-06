class SiteTagMapping < ApplicationRecord
  belongs_to :site
  belongs_to :tag 
end
