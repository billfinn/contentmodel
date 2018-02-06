ActiveAdmin.register Site do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :description, :template_ids => [], site_template_mappings_attributes: [:id, :site_id, :template_id, :destroy]

menu parent: 'Sites & Flow'
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs do
    f.input :name
    # tabs do
    #   tab :Templates do
    #     f.input :template_ids, as: :check_boxes, collection: Template.all.map{|t| [t.name,template.id]}
    #   end
    # end
    f.input :description
  end
  f.actions
end





end
