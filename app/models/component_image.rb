class ComponentImage < ApplicationRecord
  belongs_to :component
  belongs_to :image

  accepts_nested_attributes_for :image
end
