class Component < ApplicationRecord
  has_many :component_items
  has_many :text_items, :through => :component_items
  accepts_nested_attributes_for :component_items, :allow_destroy => true

end
