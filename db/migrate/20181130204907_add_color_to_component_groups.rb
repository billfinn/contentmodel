class AddColorToComponentGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :component_groups, :color, :string
  end
end
