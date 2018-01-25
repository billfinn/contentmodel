ActiveAdmin.register Component do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :goal, :cta, :content_assets, :image, :description, component_items_attributes: [:id, :component_id, :text_item_id, :destroy]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

menu parent: 'Content Model'

index do
  column :name do |component|
    link_to component.name, admin_component_path(component)
  end

  actions
end
# filter only by title
filter :name

show do |component|
  attributes_table do
    row :text_items do |component|
      component.text_items.map { |d| d.name }.join("&nbsp;&nbsp;>&nbsp;&nbsp;").html_safe
    end
  end
end

form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Component" do
    f.input :name
    f.input :goal
    f.input :cta
    f.input :content_assets
    f.input :description
  f.inputs "Text Items" do
    f.has_many :component_items, :allow_destroy => true do |deg|
      deg.input :text_item
      end
    end
  end
  f.actions
end

end
