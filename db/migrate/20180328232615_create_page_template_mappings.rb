class CreatePageTemplateMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :page_template_mappings do |t|
      t.integer :page_id
      t.integer :template_id

      t.timestamps
    end
  end
end
