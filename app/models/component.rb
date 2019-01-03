class Component < ApplicationRecord
  # belongs_to :component_type
  belongs_to :component_group
  accepts_nested_attributes_for :component_group
  # accepts_nested_attributes_for :component_type

  has_many :component_items
  has_many :text_items, -> { order('component_items.position') }, :through => :component_items
  accepts_nested_attributes_for :component_items, :allow_destroy => true

  has_many :template_components
  has_many :templates, :through => :template_components

  has_many :component_images
  has_many :images, :through => :component_images
  accepts_nested_attributes_for :component_images, :allow_destroy => true


end
