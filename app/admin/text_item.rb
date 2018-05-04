ActiveAdmin.register TextItem do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :text_id, :itemtext, :page_id, :component_id, :order
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

menu parent: 'Content Model'


form do |f|
  f.inputs do
    f.input :name, :label => 'Name'
    f.input :page_id, :label => 'Page', :as => :select, :collection => Page.all.map{|a| ["#{a.name}", a.id]}
    f.input :text_id, :label => 'Text Type', :as => :select, :collection => Text.all.map{|t| ["#{t.name}", t.id]}
    f.input :order, :label => 'Order'
    f.input :itemtext, :label => 'Item Text'
    f.actions
  end
end

end
