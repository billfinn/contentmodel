class AddPageIdToTextItem < ActiveRecord::Migration[5.1]
  def change
    add_column :text_items, :page_id, :integer
  end
end
