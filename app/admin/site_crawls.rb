ActiveAdmin.register SiteCrawl do

  active_admin_import  validate: false,
                        csv_options: {col_sep: "," },
                        before_import: ->(importer){ SiteCrawl.delete_all },
                        batch_size: 2000

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :site_id, :address, :content, :status_code, :status, :title_1, :title_1_length, :title_1_pixel_width, :meta_description_1, :meta_description_1_length, :meta_description_1_pixel_width, :meta_keyword_1, :meta_keywords_1_length, :h1_1, :h1_1_length, :h1_2, :h1_2_length, :h2_1, :h2_2, :h2_1_length, :h2_2_length, :meta_robots_1, :meta_refresh_1, :canonical_link_element_1, :size, :word_count, :text_ratio, :level, :inlinks, :outlinks, :external_outlinks, :response_time, :last_modified, :redirect_uri
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
  column :site_id
  column :address do |site_crawl|
    link_to site_crawl.address, admin_site_crawl_path(site_crawl)
  end
  column :created_at

  actions
end

end
