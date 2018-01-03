class CreateSeoMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :seo_mappings do |t|
      t.integer :seo_term_id
      t.integer :page_id

      t.timestamps
    end
  end
end
