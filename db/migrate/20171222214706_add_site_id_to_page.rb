class AddSiteIdToPage < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :site_id, :integer
  end
end
