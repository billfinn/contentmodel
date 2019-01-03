class AddTextIdToTextItem < ActiveRecord::Migration[5.1]
  def change
    add_column :text_items, :text_id, :integer
  end
end
