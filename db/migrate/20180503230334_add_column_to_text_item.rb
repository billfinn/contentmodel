class AddColumnToTextItem < ActiveRecord::Migration[5.1]
  def change
    add_column :text_items, :component_id, :integer
  end
end
