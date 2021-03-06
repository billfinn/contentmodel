class Page < ApplicationRecord
  has_ancestry
  has_many :text_items

  has_many :tag_mappings
  has_many :tags, :through => :tag_mappings
  accepts_nested_attributes_for :tag_mappings, :allow_destroy => true

  has_many :seo_mappings
  has_many :seo_terms, :through => :seo_mappings
  accepts_nested_attributes_for :seo_mappings, :allow_destroy => true

  # has_many :page_template_mappings
  # has_many :templates, :through => :page_template_mappings
  # accepts_nested_attributes_for :page_template_mappings, :allow_destroy => true

  belongs_to :site
  
  has_many :page_template_mappings
  has_many :templates, :through => :page_template_mappings
  accepts_nested_attributes_for :page_template_mappings, :allow_destroy => true

  # belongs_to :template
  # accepts_nested_attributes_for :template, :allow_destroy => true

  validates :name, :presence => true

  # scope :for_site, -> { Page.where( site_id: (params[:id]) ) }
  scope :for_jci, -> { where( site_id: 1 ) }
  scope :for_tyco, -> { where( site_id: 2 ) }

  def self.json_tree(nodes)
      nodes.map do |node, sub_nodes|
        {:name => node.name, :id => node.id, :children => Page.json_tree(sub_nodes).compact}
      end
  end

end
