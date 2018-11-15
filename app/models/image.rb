class Image < ApplicationRecord

  has_many :component_images
  has_many :components, :through => :component_images
  accepts_nested_attributes_for :component_images
  
end
