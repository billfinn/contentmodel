class ComponentItem < ApplicationRecord
  belongs_to :component
  belongs_to :text_item
end
