class CreateSiteTaxonomyMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_taxonomy_mappings do |t|
      t.integer :site_id
      t.integer :taxonomy_id

      t.timestamps
    end
  end
end
