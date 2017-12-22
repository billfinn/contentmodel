class Page < ApplicationRecord
  has_many :text_items
  has_ancestry
end
