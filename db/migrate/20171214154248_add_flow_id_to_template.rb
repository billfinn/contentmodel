class AddFlowIdToTemplate < ActiveRecord::Migration[5.1]
  def change
    add_column :templates, :flow_id, :integer
  end
end
