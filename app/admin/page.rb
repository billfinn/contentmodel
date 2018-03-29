ActiveAdmin.register Page do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :description, :ancestry, :parent_id, :site_id, :image, :tag_ids => [], tag_mappings_attributes: [:id, :tag_id, :page_id, :destroy], :hierarchy_ids => [], hierarchy_mappings_attributes: [:id, :hierarchy_id, :page_id, :destroy], :seo_term_ids => [], seo_mappings_attributes: [:id, :seo_term_id, :page_id, :destroy], :template_ids => [], page_template_mappings_attributes: [:id, :page_id, :template_id, :_destroy, :_update]
menu parent: 'Sites & Flow', priority: 5
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
  # column 'Image', sortable: :image_file_name do |page| link_to page.image_file_name, page.image.url end
  actions
end

show do


end

form do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs do
    f.input :name
    f.input :parent_id, :label => 'Page Parent ID', :as => :select, :collection => Page.all.map{|u| ["#{u.name}", u.id, include_blank: true]}
    f.input :site_id, :label => 'Site ID', :as => :select, :collection => Site.all.map{|s| ["#{s.name}", s.id, include_blank: true]}
      f.inputs "Template" do
          f.has_many :page_template_mappings do |ptm|
            ptm.input :template
            ptm.input :_destroy, :as => :boolean, :label => "Remove?"
          end
      end
    f.input :image, required: true, as: :file
    tabs do
      # tab :Template do
      #   f.input :template_ids, as: :radio, collection: Template.all.map{|template| [template.name, template.id]}
      # end
      tab :Tags do
        f.input :tag_ids, as: :check_boxes, collection: Tag.all.map{|tag| [tag.name, tag.id]}
      end
      tab :S_E_O do
        f.input :seo_term_ids, as: :check_boxes, collection: SeoTerm.all.map{|seo_term| [seo_term.term, seo_term.id]}
      end
    end
    f.input :description
  end
  f.actions
end

end
