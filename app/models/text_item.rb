class TextItem < ApplicationRecord
  belongs_to :text, optional: true
  belongs_to :page, optional: true
  belongs_to :component, optional: true
end
