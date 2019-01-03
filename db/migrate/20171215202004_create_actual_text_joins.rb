class CreateActualTextJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :actual_text_joins do |t|
      t.integer :text_id
      t.integer :textitem_id
      t.integer :page_id
      t.integer :site_id

      t.timestamps
    end
  end
end
