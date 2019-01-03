class AddPositionToComponentItems < ActiveRecord::Migration[5.1]
  def change
    add_column :component_items, :position, :integer
  end
end
