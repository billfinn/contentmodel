class CreateComponentItems < ActiveRecord::Migration[5.1]
  def change
    create_table :component_items do |t|
      t.integer :component_id
      t.integer :text_item_id

      t.timestamps
    end
  end
end
