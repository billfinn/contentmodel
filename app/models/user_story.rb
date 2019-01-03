class UserStory < ApplicationRecord
  has_many :template_user_story_mappings
  has_many :templates, :through => :template_user_story_mappings
  # accepts_nested_attributes_for :template_user_story_mappings, :allow_destroy => true
end
