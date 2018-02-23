ActiveAdmin.register LegacySite do
  active_admin_import  validate: false,
                            csv_options: {col_sep: "," },
                            before_import: ->(importer){ LegacySite.delete_all },
                            batch_size: 1000
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :name, :url, :domain_authority, :traffic, :referring_domains

menu parent: 'Sites & Flow', priority: 2
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :id
  column :name do |legacy_site|
    link_to legacy_site.name, admin_legacy_site_path(legacy_site)
  end
  column :created_at

  actions
end

end
