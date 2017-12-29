class PageWorkflow < ApplicationRecord
  belongs_to :page
  belongs_to :workflow
end
