class CreateTagMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_mappings do |t|
      t.integer :tag_id
      t.integer :page_id

      t.timestamps
    end
  end
end
