class CreateTemplateAudienceMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :template_audience_mappings do |t|
      t.integer :audience_id
      t.integer :template_id

      t.timestamps
    end
  end
end
