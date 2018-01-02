class Page < ApplicationRecord
  has_ancestry
  has_many :text_items

  validates :name, :presence => true

end
