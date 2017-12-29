ActiveAdmin.register Workflow do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

permit_params :list, :of, :attributes, :on, :model, :name, :description, page_workflows_attributes: [:id, :page_id, :workflow_id, :destroy]

menu parent: 'Sites & Flow'

index do
  column :name do |workflow|
    link_to workflow.name, admin_workflow_path(workflow)
  end

  actions
end
# filter only by title
filter :title

show do |workflow|
  attributes_table do
    row :pages do |workflow|
      workflow.pages.map { |d| d.name }.join("&nbsp;&nbsp;>&nbsp;&nbsp;").html_safe
    end
  end
end

form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Workflow" do
    f.input :name
    # f.input :description
  f.inputs "Pages" do
    f.has_many :page_workflows, :allow_destroy => true do |deg|
      deg.input :page
      end
    end
  end
  f.actions
end

#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
