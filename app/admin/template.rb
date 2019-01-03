ActiveAdmin.register Template do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :image, :document, :existing, :description, :flow_id, :order, :definition, :user_needs, :success_longterm, :success_shortterm, :legacy_reference, :additional_requirements, :client_dependencies, :design_notes, :image_sizes, template_components_attributes: [:id, :template_id, :component_id, :position, :_destroy, :_update], :hierarchy_ids => [], hierarchy_mappings_attributes: [:id, :hierarchy_id, :template_id, :destroy], site_template_mappings_attributes: [:id, :site_id, :template_id, :_destroy, :_update],  :audience_ids => [], template_audience_mappings_attributes: [:id, :audience_id, :template_id, :destroy], template_business_goal_mappings_attributes: [:id, :goals_business_id, :template_id, :_destroy, :_update], template_customer_goal_mappings_attributes: [:id, :goals_customer_id, :template_id, :_destroy, :_update], template_strategic_pillar_mappings_attributes: [:id, :goals_strategy_pillar_id, :template_id, :_destroy, :_update], template_user_story_mappings_attributes: [:id, :user_story_id, :template_id, :_destroy, :_update]

menu parent: 'Content Model', priority: 0
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
  # column :site do |s|
  #   link_to s.sites.site.name
  # end
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
    f.input :existing
    f.input :document
    f.input :image
    f.input :image_sizes
    f.input :definition
    f.inputs "Audiences" do
      f.input :audience_ids, as: :check_boxes, collection: Audience.all.map{|audience| [audience.name, audience.id]}
    end
    tabs do
      tab "Business Goals" do
        f.inputs "Business Goals" do
            f.has_many :template_business_goal_mappings, sortable: :position, sortable_start: 1 do |bg|
              bg.input :goals_business
              bg.input :_destroy, :as => :boolean, :label => "Remove?"
            end
        end
      end
      tab "Customer Goals" do
        f.inputs "Customer Goals" do
            f.has_many :template_customer_goal_mappings, sortable: :position, sortable_start: 1 do |cg|
              cg.input :goals_customer
              cg.input :_destroy, :as => :boolean, :label => "Remove?"
            end
        end
      end
      tab "Strategy Pillars" do
        f.inputs "Strategy Pillars" do
            f.has_many :template_strategic_pillar_mappings, sortable: :position, sortable_start: 1 do |sg|
              sg.input :goals_strategy_pillar
              sg.input :_destroy, :as => :boolean, :label => "Remove?"
            end
        end
      end
      tab "User Stories" do
        f.inputs "User Stories" do
            f.has_many :template_user_story_mappings, sortable: :position, sortable_start: 1 do |us|
              us.input :user_story
              us.input :_destroy, :as => :boolean, :label => "Remove?"
            end
        end
      end
    end

    f.input :user_needs
    f.input :success_longterm
    f.input :success_shortterm
    f.input :legacy_reference
    f.input :additional_requirements
    f.input :client_dependencies
    f.input :design_notes

  tabs do

    tab :Components do
      f.inputs "Components" do
          f.has_many :template_components, sortable: :position, sortable_start: 1 do |deg|
            deg.input :component
            deg.input :_destroy, :as => :boolean, :label => "Remove?"
          end
      end
    end

    tab :Sites do
      f.inputs "Sites" do
          f.has_many :site_template_mappings do |stm|
            stm.input :site
            stm.input :_destroy, :as => :boolean, :label => "Remove?"
          end
      end
    end

    tab :Messaging_Hierarchy do
      f.input :hierarchy_ids, as: :check_boxes, collection: Hierarchy.all.map{|hierarchy| [hierarchy.name, hierarchy.id]}
    end

  end
  f.actions
  end
end

end
