class AddSiteIdToAudienceMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :audience_messages, :site_id, :integer
  end
end
