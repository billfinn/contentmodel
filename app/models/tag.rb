class Tag < ApplicationRecord
  has_ancestry

  scope :all
  scope :content_type, ->{where(ancestry: 6)}
  scope :expertise, ->{where(ancestry: 1)}
  scope :offering_type, ->{where(ancestry: 3)}
  scope :brand_architecture, ->{where(ancestry: 4)}
  scope :product_brand, ->{where(ancestry: 5)}
  scope :audience, ->{where(ancestry: 2)}
  scope :industry, ->{where(ancestry: 7)}
  scope :installation, ->{where(ancestry: 8)}
  scope :region, ->{where(ancestry: 12)}
  scope :lead_type, ->{where(ancestry: 11)}
end
