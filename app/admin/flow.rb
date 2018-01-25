ActiveAdmin.register Flow do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :description, template_flows_attributes: [:id, :template_id, :flow_id, :_destroy]

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
  column :name do |flow|
    link_to flow.name, admin_flow_path(flow)
  end

  actions
end
# filter only by title
filter :title

show do |flow|
  attributes_table do
    row :templates do |flow|
      flow.templates.map { |d| d.name }.join("&nbsp;&nbsp;>&nbsp;&nbsp;").html_safe
    end
  end
end

form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Flow" do
    f.input :name
    # f.input :description
  f.inputs "Templates" do
    f.has_many :template_flows do |deg|
      deg.input :template
      deg.input :_destroy, :as => :boolean, :label => "Remove?"
      end
    end
  end
  f.actions
end



# show :name => :name do
#   panel "Templates" do
#     table_for flow.templates do |t|
#       t.column("Name") { |template| link_to template.name, admin_template_path(template) }
#       t.column("Order") { |template| template.order }
#     end
#   end
# end

end
