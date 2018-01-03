ActiveAdmin.register Tag do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

permit_params :list, :of, :attributes, :on, :model, :name, :description, :ancestry, :parent_id

menu parent: 'Messaging'




scope :all
# scope :content_type
scope :expertise
scope :offering
scope :brand_arch
scope :product_brand
# scope :audience
scope :industry
scope :installation
scope :region
# scope :lead_type
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs do
    f.input :name
    f.input :parent_id, :label => 'Parent ID', :as => :select, :collection => Tag.all.map{|u| ["#{u.name}", u.id, include_blank: true]}
    f.input :description
  end
  f.actions
end

end
