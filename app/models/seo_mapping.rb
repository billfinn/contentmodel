class SeoMapping < ApplicationRecord
  belongs_to :page
  belongs_to :seo_term 
end
