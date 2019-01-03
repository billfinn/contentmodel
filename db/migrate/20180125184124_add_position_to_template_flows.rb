class AddPositionToTemplateFlows < ActiveRecord::Migration[5.1]
  def change
    add_column :template_flows, :position, :integer
  end
end
