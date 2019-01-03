class CreateSiteTagMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_tag_mappings do |t|
      t.integer :site_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
