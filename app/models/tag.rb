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
  scope :installation, ->{where(ancestry: 'Installation')}
  scope :region, ->{where(ancestry: 'Region')}
  scope :lead_type, ->{where(ancestry: 'Lead Type')}
end
