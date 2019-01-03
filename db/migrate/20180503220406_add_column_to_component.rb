class AddColumnToComponent < ActiveRecord::Migration[5.1]
  def change
    add_column :components, :component_group, :integer
  end
end
