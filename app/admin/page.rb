ActiveAdmin.register Page do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :description, :ancestry, :parent_id, :site_id, :tag_ids => [], tag_mappings_attributes: [:id, :tag_id, :page_id, :destroy], :hierarchy_ids => [], hierarchy_mappings_attributes: [:id, :hierarchy_id, :page_id, :destroy], :seo_term_ids => [], seo_mappings_attributes: [:id, :seo_term_id, :page_id, :destroy]

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

show do


end

form do |f|
  f.inputs do
    f.input :name
    f.input :parent_id, :label => 'Page Parent ID', :as => :select, :collection => Page.all.map{|u| ["#{u.name}", u.id, include_blank: true]}
    f.input :site_id, :label => 'Site ID', :as => :select, :collection => Site.all.map{|s| ["#{s.name}", s.id, include_blank: true]}

    tabs do
      tab :Tags do
        f.input :tag_ids, as: :check_boxes, collection: Tag.all.map{|tag| [tag.name, tag.id]}
      end

      tab :Messaging_Hierarchy do
        f.input :hierarchy_ids, as: :check_boxes, collection: Hierarchy.all.map{|hierarchy| [hierarchy.name, hierarchy.id]}
      end

      tab :S_E_O do
        f.input :seo_term_ids, as: :check_boxes, collection: SeoTerm.all.map{|seo_term| [seo_term.term, seo_term.id]}
      end
    end

    # f.input :tag_ids, as: :check_boxes, collection: Tag.all.map{|tag| [tag.name, tag.id]}
    # f.inputs do
    #   f.has_many :tag_mappings, sortable: :order, sortable_start: 1 do |t|
    #     t.input :tag
    #   end
    # end
    f.input :description
  end
  f.actions
end

end
