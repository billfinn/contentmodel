class Tag < ApplicationRecord
  has_ancestry

  scope :content_type, ->{where(ancestry: 6)}
  scope :expertise, ->{where(ancestry: 1)}
  scope :offering_type, ->{where(ancestry: 3)}
end
