class CreateSiteFlowMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_flow_mappings do |t|
      t.integer :site_id
      t.integer :flow_id
      t.integer :order

      t.timestamps
    end
  end
end
