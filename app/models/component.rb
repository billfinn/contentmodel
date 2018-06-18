class Component < ApplicationRecord
  belongs_to :component_type
  belongs_to :component_group
  accepts_nested_attributes_for :component_group
  
  has_many :component_items
  has_many :text_items, -> { order('component_items.position') }, :through => :component_items
  accepts_nested_attributes_for :component_items, :allow_destroy => true




end
