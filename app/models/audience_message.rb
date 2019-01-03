class AudienceMessage < ApplicationRecord
  belongs_to :audience
  belongs_to :hierarchy
  belongs_to :site 
end
