ActiveAdmin.register Template do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :description, :flow_id, :order, :page_purpose, :audience, :kpi, :likely_task, :personalization_needs, :creation_guidelines, template_components_attributes: [:id, :template_id, :component_id, :destroy]


menu parent: 'Content Model'
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  column :name do |template|
    link_to template.name, admin_template_path(template)
  end

  actions
end
# filter only by title
filter :name


show do |template|
  attributes_table do
    row :components do |template|
      template.components.map { |d| d.name }.join("&nbsp;&nbsp;>&nbsp;&nbsp;").html_safe
    end
  end
end

form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Page Template" do
    f.input :name
    f.input :page_purpose
    f.input :audience
    f.input :kpi
    f.input :likely_task
    f.input :personalization_needs
    f.input :creation_guidelines
    # f.input :description
  f.inputs "Components" do
    f.has_many :template_components, :allow_destroy => true do |deg|
      deg.input :component
      end
    end
  end
  f.actions
end


end
