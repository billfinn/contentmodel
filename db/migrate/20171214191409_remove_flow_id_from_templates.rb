class RemoveFlowIdFromTemplates < ActiveRecord::Migration[5.1]
  def change
    remove_column :templates, :flow_id, :integer
  end
end
