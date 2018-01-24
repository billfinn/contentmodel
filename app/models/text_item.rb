class TextItem < ApplicationRecord
  belongs_to :text
  belongs_to :page
  belongs_to :component
end
