class CreateHierarchyMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :hierarchy_mappings do |t|
      t.integer :hierarchy_id
      t.integer :page_id

      t.timestamps
    end
  end
end
