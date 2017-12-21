class Template < ApplicationRecord
   # has_many :template_flows
   # has_many :flows, :through => template_flows

   validates :name, :presence => true
   # validates :inclusion => { :in => [true, false]}

end
