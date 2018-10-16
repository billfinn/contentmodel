class TemplateUserStoryMapping < ApplicationRecord
  belongs_to :template
  belongs_to :user_story
end
