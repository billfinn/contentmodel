class Hierarchy < ApplicationRecord
  has_ancestry

  has_many :hierarchy_mappings
  has_many :pages, :through => :hierarchy_mappings
  accepts_nested_attributes_for :hierarchy_mappings

end
