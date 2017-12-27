ActiveAdmin.register Page do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :description, :ancestry, :parent_id, :site_id

menu parent: 'Sites & Flow'
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

## we want to select from a list of text items assigned to this page from the text-items area
## so a multi-select list populated from the text-items area
index do
  selectable_column
  column :name
  column :ancestry
  column :site_id
  actions
end

form do |f|
  f.inputs do
    f.input :name
    f.input :parent_id, :label => 'Page Parent ID', :as => :select, :collection => Page.all.map{|u| ["#{u.name}", u.id, include_blank: true]}
    f.input :site_id, :label => 'Site ID', :as => :select, :collection => Site.all.map{|s| ["#{s.name}", s.id, include_blank: true]}
    f.input :description
  end
  f.actions
end

end
