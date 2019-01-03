class AddPositionToTemplateComponent < ActiveRecord::Migration[5.1]
  def change
    add_column :template_components, :position, :integer
  end
end
