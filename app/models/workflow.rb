class Workflow < ApplicationRecord
  has_many :page_workflows
  has_many :pages, :through => :page_workflows
  accepts_nested_attributes_for :page_workflows, :allow_destroy => true

end
