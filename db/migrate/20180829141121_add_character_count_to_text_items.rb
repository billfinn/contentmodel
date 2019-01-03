class AddCharacterCountToTextItems < ActiveRecord::Migration[5.1]
  def change
    add_column :text_items, :character_count, :integer
  end
end
