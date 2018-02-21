class Tag < ApplicationRecord
  has_ancestry

  has_many :tag_mappings
  has_many :pages, :through => :tag_mappings
  accepts_nested_attributes_for :tag_mappings

  has_many :site_tag_mappings
  has_many :sites, :through => :site_tag_mappings
  accepts_nested_attributes_for :site_tag_mappings, :allow_destroy => true

  # scope :content_type, ->{where(ancestry: 6)}
  scope :expertise, ->{where(ancestry: 1)}
  scope :offering, ->{where(ancestry: 3)}
  scope :brand_arch, ->{where(ancestry: 4)}
  scope :product_brand, ->{where(ancestry: 5)}
  # scope :audience, ->{where(ancestry: 2)}
  scope :industry, ->{where(ancestry: 7)}
  scope :installation, ->{where(ancestry: 8)}
  scope :region, ->{where(ancestry: 12)}
  # scope :lead_type, ->{where(ancestry: 11)}

  # def self.json_tree(nodes)
  #     nodes.map do |node, sub_nodes|
  #       {:name => node.name, :id => node.id, :children => Tag.json_tree(sub_nodes).compact}
  #     end
  # end

  def self.json_tree(nodes)
      nodes.map do |node, sub_nodes|
        {:name => node.name, :id => node.id, :children => Tag.json_tree(sub_nodes).compact}
      end
  end

end
