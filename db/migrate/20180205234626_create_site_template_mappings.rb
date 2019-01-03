class CreateSiteTemplateMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_template_mappings do |t|
      t.integer :site_id
      t.integer :template_id

      t.timestamps
    end
  end
end
