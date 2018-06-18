ActiveAdmin.register Component do

  active_admin_import  validate: false,
                        csv_options: {col_sep: "," },
                        # before_import: ->(importer){ SiteCrawl.delete_all },
                        batch_size: 2000

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :componenttype_id, :component_group, :goal, :cta, :content_assets, :image, :description, :ispersonalized, :personalization_rules, :is_taggable, :tag_groups, :requirements, :data, component_items_attributes: [:id, :component_id, :text_item_id, :position, :_destroy, :_update], component_types_attributes: [:id, :name], component_groups_attributes: [:id, :name]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

menu parent: 'Content Model', priority: 1

index do
  column :name do |component|
    link_to component.name, admin_component_path(component)
  end
  column :component_group do |cg|
    cg.component_group
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
    f.input :componenttype_id, :label => 'Component Type', :as => :select, :collection => ComponentType.all.map{|c| ["#{c.name}", c.id, include_blank: true]}
    f.input :component_group, :label => 'Component Group', :as => :select, :collection => ComponentGroup.all.map{|g| ["#{g.name}", g.id, include_blank: true]}
    f.input :image, :label => 'Image'
    f.input :is_taggable, :label => 'Is Taggable?', as: :boolean
    f.input :tag_groups, :label => 'Tag Groups'
    f.input :ispersonalized, :label => 'Is Personalized?', as: :boolean
    f.input :personalization_rules, :label => 'Personalization Rules'
    f.input :goal
    f.input :cta
    f.input :content_assets
    f.input :requirements, :label => 'Requirements', :input_html => { :class => 'tinymce' }
    f.input :data, :label => 'Data', :input_html => { :class => 'tinymce' }
    f.input :description, :label => 'Description', :input_html => { :class => 'tinymce' }
  f.inputs "Text Items" do
    f.has_many  :component_items, sortable: :position, sortable_start: 1 do |deg|
      deg.input :text_item
      deg.input :_destroy, :as => :boolean, :label => "Remove?"
      end
    end
  end
  f.actions
end

end
