class SeoTerm < ApplicationRecord

  has_many :seo_mappings
  has_many :pages, :through => :seo_mappings
  accepts_nested_attributes_for :seo_mappings


end
