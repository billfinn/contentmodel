class Template < ApplicationRecord

   # has_many :page_template_mappings
   # has_many :pages, :through => :page_template_mappings
   # accepts_nested_attributes_for :page_template_mappings, :allow_destroy => true
   has_many :pages

   has_many :template_components
   has_many :components, -> { order('template_components.position') }, :through => :template_components
   accepts_nested_attributes_for :template_components, :allow_destroy => true

   has_many :hierarchy_mappings
   has_many :hierarchies, :through => :hierarchy_mappings
   accepts_nested_attributes_for :hierarchy_mappings, :allow_destroy => true

   has_many :site_template_mappings
   has_many :sites, :through => :site_template_mappings
   accepts_nested_attributes_for :site_template_mappings, :allow_destroy => true

   has_many :template_audience_mappings
   has_many :audiences, :through => :template_audience_mappings
   accepts_nested_attributes_for :template_audience_mappings, :allow_destroy => true

   has_many :page_template_mappings
   has_many :pages, :through => :page_template_mappings
   accepts_nested_attributes_for :page_template_mappings, :allow_destroy => true

   has_many :template_business_goal_mappings
   has_many :goals_businesses, :through => :template_business_goal_mappings
   accepts_nested_attributes_for :template_business_goal_mappings, :allow_destroy => true

   has_many :template_customer_goal_mappings
   has_many :goals_customers, :through => :template_customer_goal_mappings
   accepts_nested_attributes_for :template_customer_goal_mappings, :allow_destroy => true

   has_many :template_strategic_pillar_mappings
   has_many :goals_strategy_pillars, :through => :template_strategic_pillar_mappings
   accepts_nested_attributes_for :template_strategic_pillar_mappings, :allow_destroy => true

   has_many :template_user_story_mappings
   has_many :user_stories, :through => :template_user_story_mappings
   accepts_nested_attributes_for :template_user_story_mappings, :allow_destroy => true

end
