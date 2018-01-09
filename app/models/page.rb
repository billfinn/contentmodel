class Page < ApplicationRecord
  has_ancestry
  has_many :text_items

  has_many :tag_mappings
  has_many :tags, :through => :tag_mappings
  accepts_nested_attributes_for :tag_mappings, :allow_destroy => true

  has_many :hierarchy_mappings
  has_many :hierarchies, :through => :hierarchy_mappings
  accepts_nested_attributes_for :hierarchy_mappings, :allow_destroy => true

  has_many :seo_mappings
  has_many :seo_terms, :through => :seo_mappings
  accepts_nested_attributes_for :seo_mappings, :allow_destroy => true

  belongs_to :site
  belongs_to :page_workflow
  belongs_to :workflows

  validates :name, :presence => true

end
